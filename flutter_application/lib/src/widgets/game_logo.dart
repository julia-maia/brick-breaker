import 'package:flutter/material.dart';

class GameLogo extends StatelessWidget {
  const GameLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "BRICK\nBREAKER",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'PressStart2P',
        fontSize: 48,
        fontWeight: FontWeight.w900,
        height: 1.1,
        color: Colors.black,
        letterSpacing: 1,
      ),
    );
  }
}
