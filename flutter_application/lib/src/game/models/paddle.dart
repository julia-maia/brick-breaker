class Paddle {
  double x;
  double y;

  final double width;
  final double height;

  Paddle({
    required this.x,
    required this.y,
    this.width = 120,
    this.height = 16,
  });

  void move(double deltaX, double gameWidth) {
    x += deltaX;

    x = x.clamp(0.0, gameWidth - width);
  }
}