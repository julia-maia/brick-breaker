import 'package:flutter/material.dart';

import '../game/controllers/game_controller.dart';
import '../game/models/game_settings.dart';
import '../widgets/menu_button.dart';

class GameBrickBreaker extends StatefulWidget {
  final GameSettings settings;

  const GameBrickBreaker({super.key, required this.settings});

  @override
  State<GameBrickBreaker> createState() => _GameBrickBreakerState();
}

class _GameBrickBreakerState extends State<GameBrickBreaker>
    with SingleTickerProviderStateMixin {
  late AnimationController gameLoop;

  late final GameController controller;

  Duration _lastElapsed = Duration.zero;

  Size _gameSize = Size.zero;

  bool initialized = false;

  bool _gameOverDialogOpen = false;
  bool _gameWonDialogOpen = false;

  @override
  void initState() {
    super.initState();

    controller = GameController(settings: widget.settings);

    gameLoop = AnimationController(
      vsync: this,
      duration: const Duration(days: 1),
    );

    gameLoop.addListener(_update);

    gameLoop.forward();
  }

  // ============================================================
  // GAME LOOP
  // ============================================================

  void _update() {
    if (!initialized || !mounted) {
      return;
    }

    final elapsed = gameLoop.lastElapsedDuration;

    if (elapsed == null) {
      return;
    }

    final double delta =
        (elapsed - _lastElapsed).inMicroseconds /
        Duration.microsecondsPerSecond;

    _lastElapsed = elapsed;

    /*
     * Impede grandes saltos caso o aplicativo
     * trave ou volte do background.
     */
    final double deltaTime = delta.clamp(0.0, 1 / 30);

    setState(() {
      controller.update(_gameSize, deltaTime);
    });

    if (controller.gameOver && !_gameOverDialogOpen) {
      _gameOverDialogOpen = true;

      gameLoop.stop();

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _showGameOverDialog();
        }
      });
    }

    if (controller.gameWon && !_gameWonDialogOpen) {
      _gameWonDialogOpen = true;
      gameLoop.stop();

      WidgetsBinding.instance.addPostFrameCallback((__) {
        if (mounted) {
          _showGameWonDialog();
        }
      });
    }
  }

  // ============================================================
  // GAME OVER
  // ============================================================

  void _showGameOverDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,

      builder: (dialogContext) {
        return Dialog(
          backgroundColor: Colors.transparent,

          elevation: 0,

          child: Container(
            width: 300,

            padding: const EdgeInsets.all(30),

            decoration: BoxDecoration(
              color: const Color(0xFFD3D3D3),

              borderRadius: BorderRadius.circular(45),

              border: Border.all(color: Colors.black),
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                const Text(
                  'Você perdeu!',

                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontFamily: 'PressStart2P',

                    fontSize: 18,

                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  'Deseja passar para\n'
                  'o próximo nível?',

                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontFamily: 'PressStart2P',

                    fontSize: 12,

                    height: 1.8,

                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 35),

                MenuButton(
                  texto: 'Próximo nível',

                  onPressed: () {
                    Navigator.pop(dialogContext);

                    _goToNextLevel();
                  },
                ),

                const SizedBox(height: 20),

                MenuButton(
                  texto: 'Reiniciar nível',

                  onPressed: () {
                    Navigator.pop(dialogContext);

                    _restarLevel();
                  },
                ),

                const SizedBox(height: 20),

                MenuButton(
                  texto: 'Inicio',

                  onPressed: () {
                    Navigator.pop(dialogContext);

                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ============================================================
  // GAME WON
  // ============================================================
  void _showGameWonDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text("Você venceu!", textAlign: TextAlign.center),
          content: const Text(
            "Parabéns! Você concluiu todos os níveis.",
            textAlign: TextAlign.center,
          ),
          actions: [
            MenuButton(
              texto: "Voltar para o inicio.",
              onPressed: () {
                Navigator.pop(dialogContext);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  // ============================================================
  // PRÓXIMO NÍVEL APÓS DERROTA
  // ============================================================

  void _goToNextLevel() {
    final bool hasNextLevel = controller.nextLevel(_gameSize);

    if (!hasNextLevel) {
      Navigator.pop(context);

      return;
    }

    _gameOverDialogOpen = false;

    _lastElapsed = gameLoop.lastElapsedDuration ?? Duration.zero;

    gameLoop.forward();
  }

  // ============================================================
  // REINICIAR NÍVEL APÓS DERROTA
  // ============================================================
  void _restarLevel() {
    gameLoop.stop();

    setState(() {
      controller.retartLevel(_gameSize);
    });

    _gameOverDialogOpen = false;

    _lastElapsed = gameLoop.lastElapsedDuration ?? Duration.zero;

    gameLoop.forward();
  }

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    gameLoop.removeListener(_update);

    gameLoop.dispose();

    super.dispose();
  }

  // ============================================================
  // INTERFACE
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            _gameSize = Size(constraints.maxWidth, constraints.maxHeight);

            if (!initialized) {
              controller.initialize(gameSize: _gameSize);

              initialized = true;

              /*
               * Evita um deltaTime muito grande
               * no primeiro frame.
               */
              _lastElapsed = gameLoop.lastElapsedDuration ?? Duration.zero;
            }

            return GestureDetector(
              behavior: HitTestBehavior.opaque,

              onHorizontalDragUpdate: (details) {
                setState(() {
                  controller.paddle.move(details.delta.dx, _gameSize.width);
                });
              },

              child: Stack(
                children: [
                  _buildBricks(),

                  _buildBall(),

                  _buildPaddle(),

                  _buildLevelIndicator(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // ============================================================
  // BOLA
  // ============================================================

  Widget _buildBall() {
    final ball = controller.ball;

    return Positioned(
      left: ball.x,
      top: ball.y,

      child: Container(
        width: ball.size,
        height: ball.size,

        decoration: const BoxDecoration(
          color: Colors.black,

          shape: BoxShape.circle,
        ),
      ),
    );
  }

  // ============================================================
  // PADDLE
  // ============================================================

  Widget _buildPaddle() {
    final paddle = controller.paddle;

    return Positioned(
      left: paddle.x,
      top: paddle.y,

      child: Container(
        width: paddle.width,
        height: paddle.height,

        decoration: BoxDecoration(
          color: Colors.black,

          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  // ============================================================
  // TIJOLOS
  // ============================================================

  Widget _buildBricks() {
    return Stack(
      children: controller.bricks
          .where((brick) => !brick.destroyed)
          .map(
            (brick) => Positioned(
              left: brick.rect.left,

              top: brick.rect.top,

              child: Container(
                width: brick.rect.width,

                height: brick.rect.height,

                color: brick.color,
              ),
            ),
          )
          .toList(),
    );
  }

  // ============================================================
  // INDICADOR DE NÍVEL
  // ============================================================

  Widget _buildLevelIndicator() {
    return Positioned(
      top: 15,
      left: 0,
      right: 0,

      child: IgnorePointer(
        child: Text(
          'Nível ${controller.currentLevel + 1}',

          textAlign: TextAlign.center,

          style: const TextStyle(
            fontFamily: 'PressStart2P',

            fontSize: 14,

            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
