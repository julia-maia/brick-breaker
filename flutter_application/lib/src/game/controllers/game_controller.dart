import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../levels/levels.dart';
import '../models/ball.dart';
import '../models/brick.dart';
import '../models/game_settings.dart';
import '../models/paddle.dart';

class GameController {
  final GameSettings settings;

  late Ball ball;
  late Paddle paddle;

  final List<Brick> bricks = [];

  int currentLevel = 0;

  bool gameOver = false;
  bool gameWon = false;

  static const double ballSpeedX = 430;
  static const double ballSpeedY = 520;

  GameController({required this.settings});

  // ============================================================
  // INICIALIZAÇÃO
  // ============================================================

  void initialize({required Size gameSize}) {
    ball = Ball(
      x: gameSize.width / 2 - 9,
      y: gameSize.height * 0.62,
      velocityX: ballSpeedX,
      velocityY: -ballSpeedY,
    );

    paddle = Paddle(x: (gameSize.width - 120) / 2, y: gameSize.height - 70);

    _loadLevel(gameSize: gameSize, levelIndex: currentLevel);
  }

  // ============================================================
  // GAME LOOP
  // ============================================================

  void update(Size gameSize, double deltaTime) {
    if (gameOver || gameWon) {
      return;
    }

    /*
     * Calcula quantos pequenos passos serão necessários.
     *
     * Isso evita que uma bola rápida "teleporte" de um lado
     * do tijolo para o outro entre dois frames.
     */
    final double distanceX = ball.velocityX.abs() * deltaTime;

    final double distanceY = ball.velocityY.abs() * deltaTime;

    final double largestDistance = math.max(distanceX, distanceY);

    final double maximumStepDistance = ball.size * 0.30;

    final int subSteps = math
        .max(1, (largestDistance / maximumStepDistance).ceil())
        .clamp(1, 12);

    final double stepTime = deltaTime / subSteps;

    for (int i = 0; i < subSteps; i++) {
      ball.move(stepTime);

      _checkWallCollision(gameSize);
      _checkPaddleCollision();
      _checkBrickCollision();
      _checkBallOutOfScreen(gameSize);

      if (gameOver) {
        return;
      }
    }

    if (levelCompleted) {
      nextLevel(gameSize);
    }
  }

  // ============================================================
  // COLISÃO COM AS PAREDES
  // ============================================================

  void _checkWallCollision(Size gameSize) {
    // Parede esquerda
    if (ball.x <= 0) {
      ball.x = 0;

      ball.velocityX = ball.velocityX.abs();
    }

    // Parede direita
    if (ball.x + ball.size >= gameSize.width) {
      ball.x = gameSize.width - ball.size;

      ball.velocityX = -ball.velocityX.abs();
    }

    // Parte superior
    if (ball.y <= 0) {
      ball.y = 0;

      ball.velocityY = ball.velocityY.abs();
    }
  }

  // ============================================================
  // COLISÃO COM O PADDLE
  // ============================================================

  void _checkPaddleCollision() {
    // Só verifica o paddle quando a bola está descendo.
    if (ball.velocityY <= 0) {
      return;
    }

    final Rect ballRect = Rect.fromLTWH(ball.x, ball.y, ball.size, ball.size);

    final Rect paddleRect = Rect.fromLTWH(
      paddle.x,
      paddle.y,
      paddle.width,
      paddle.height,
    );

    if (!ballRect.overlaps(paddleRect)) {
      return;
    }

    // Retira a bola de dentro do paddle.
    ball.y = paddle.y - ball.size;

    /*
     * Descobre em qual região do paddle a bola bateu.
     *
     * -1 = extremidade esquerda
     *  0 = centro
     * +1 = extremidade direita
     */
    final double ballCenter = ball.x + ball.size / 2;

    final double paddleCenter = paddle.x + paddle.width / 2;

    double relativeHit = (ballCenter - paddleCenter) / (paddle.width / 2);

    relativeHit = relativeHit.clamp(-1.0, 1.0);

    /*
     * Permite controlar a direção horizontal
     * dependendo do ponto de impacto.
     */
    ball.velocityX = relativeHit * 500;

    /*
     * Garante que a bola volte para cima.
     */
    ball.velocityY = -ballSpeedY;
  }

  // ============================================================
  // COLISÃO COM TIJOLOS
  // ============================================================

  void _checkBrickCollision() {
    final Rect ballRect = Rect.fromLTWH(ball.x, ball.y, ball.size, ball.size);

    for (final brick in bricks) {
      if (brick.destroyed) {
        continue;
      }

      if (!ballRect.overlaps(brick.rect)) {
        continue;
      }

      brick.destroyed = true;

      /*
       * Calculamos quanto a bola entrou no tijolo
       * por cada direção.
       */

      final double overlapLeft = ballRect.right - brick.rect.left;

      final double overlapRight = brick.rect.right - ballRect.left;

      final double overlapTop = ballRect.bottom - brick.rect.top;

      final double overlapBottom = brick.rect.bottom - ballRect.top;

      final double minimumHorizontal = math.min(overlapLeft, overlapRight);

      final double minimumVertical = math.min(overlapTop, overlapBottom);

      // ----------------------------
      // Colisão lateral
      // ----------------------------

      if (minimumHorizontal < minimumVertical) {
        if (ballRect.center.dx < brick.rect.center.dx) {
          // Bateu pelo lado esquerdo do tijolo.

          ball.x = brick.rect.left - ball.size;

          ball.velocityX = -ball.velocityX.abs();
        } else {
          // Bateu pelo lado direito.

          ball.x = brick.rect.right;

          ball.velocityX = ball.velocityX.abs();
        }
      }
      // ----------------------------
      // Colisão vertical
      // ----------------------------
      else {
        if (ballRect.center.dy < brick.rect.center.dy) {
          // Bola atingiu a parte superior.

          ball.y = brick.rect.top - ball.size;

          ball.velocityY = -ball.velocityY.abs();
        } else {
          // Bola atingiu a parte inferior.

          ball.y = brick.rect.bottom;

          ball.velocityY = ball.velocityY.abs();
        }
      }

      /*
       * Apenas um tijolo pode ser destruído
       * nesta verificação.
       */
      break;
    }
  }

  // ============================================================
  // GAME OVER
  // ============================================================

  void _checkBallOutOfScreen(Size gameSize) {
    if (ball.y > gameSize.height) {
      gameOver = true;
    }
  }

  // ============================================================
  // NÍVEL CONCLUÍDO
  // ============================================================

  bool get levelCompleted {
    return bricks.isNotEmpty && bricks.every((brick) => brick.destroyed);
  }

  // ============================================================
  // PRÓXIMO NÍVEL
  // ============================================================

  bool nextLevel(Size gameSize) {
    if (currentLevel >= levels.length - 1) {
      gameWon = true;

      return false;
    }

    currentLevel++;

    gameOver = false;

    _loadLevel(gameSize: gameSize, levelIndex: currentLevel);

    _resetBall(gameSize);

    return true;
  }

  // ============================================================
  // REINICIAR NÍVEL
  // ============================================================
  void retartLevel(Size gameSize) {
    gameOver = false;
    gameWon = false;

    _loadLevel(gameSize: gameSize, levelIndex: currentLevel);

    _resetBall(gameSize);
  }

  // ============================================================
  // CARREGAMENTO DO NÍVEL
  // ============================================================

  void _loadLevel({required Size gameSize, required int levelIndex}) {
    bricks.clear();

    final level = levels[levelIndex];
    final layout = level.layout;

    const double margin = 16;
    const double verticalGap = 10;
    const double startY = 60;

    final int columns = layout.map((row) => row.length).reduce(math.max);

    final double availableWidth = gameSize.width - (margin * 2);

    final double cellWidth = availableWidth / columns;

    final double horizontalGap = settings.brickSize == BrickSize.small ? 8 : 12;

    final double brickWidth = cellWidth - horizontalGap;

    final double brickHeight = settings.brickSize == BrickSize.small ? 30 : 60;

    for (int row = 0; row < layout.length; row++) {
      for (int column = 0; column < layout[row].length; column++) {
        final int brickType = layout[row][column];

        if (brickType == 0) {
          continue;
        }

        final double x = margin + column * cellWidth + horizontalGap / 2;

        final double y = startY + row * (brickHeight + verticalGap);

        bricks.add(
          Brick(
            rect: Rect.fromLTWH(x, y, brickWidth, brickHeight),
            color: _resolveBrickColor(brickType),
          ),
        );
      }
    }
  }

  // ============================================================
  // COR DOS TIJOLOS
  // ============================================================

  Color _resolveBrickColor(int brickType) {
    switch (settings.brickColor) {
      // Usuário escolheu cinza.
      case BrickColor.grey:
        return Colors.grey;

      // Usuário escolheu preto.
      case BrickColor.black:
        return Colors.black;

      // Mantém o padrão original do nível.
      case BrickColor.defaulPattern:
        return brickType == 2 ? Colors.grey : Colors.black;
    }
  }

  // ============================================================
  // RESET
  // ============================================================

  void _resetBall(Size gameSize) {
    ball.x = gameSize.width / 2 - ball.size / 2;

    ball.y = gameSize.height * 0.62;

    ball.velocityX = ballSpeedX;

    ball.velocityY = -ballSpeedY;

    paddle.x = (gameSize.width - paddle.width) / 2;
  }
}
