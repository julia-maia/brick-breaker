class Ball {
  double x;
  double y;

  double velocityX;
  double velocityY;

  final double size;

  Ball({
    required this.x,
    required this.y,
    required this.velocityX,
    required this.velocityY,
    this.size = 20,
  });

  void move(double deltaTime) {
    x += velocityX * deltaTime;
    y += velocityY * deltaTime;
  }
}

