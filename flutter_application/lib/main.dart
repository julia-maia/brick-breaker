import 'package:flutter/material.dart';

import 'src/views/menu.dart';

void main() {
  runApp(const BrickBreakerApp());
}

class BrickBreakerApp extends StatelessWidget {
  const BrickBreakerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Brick Breaker',

      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'PressStart2P',
      ),

      home: const Menu(),
    );
  }
}
