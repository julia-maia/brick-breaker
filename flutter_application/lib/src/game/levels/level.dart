class Level {
  final int number;

  /// 0 = vazio
  /// 1 = tijolo preto
  /// 2 = tijolo cinza
  final List<List<int>> layout;

  const Level({required this.number, required this.layout});
}
