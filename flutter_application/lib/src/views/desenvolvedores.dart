import 'package:flutter/material.dart';

import '../widgets/game_logo.dart';
import '../widgets/menu_button.dart';

class Desenvolvedores extends StatelessWidget {
  const Desenvolvedores({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 35),
              const GameLogo(),
              const SizedBox(height: 60),

              Container(
                width: 350,
                height: 405,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 35,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFD3D3D3),
                  borderRadius: BorderRadius.circular(48),
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: const Column(
                  children: [
                    Text(
                      'Desenvolvedores',
                      style: TextStyle(
                        fontFamily: 'PressStart2P',
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'AYLA DJAN ANJOS ABREU\n\n'
                      'GABRIEL SOUZA\n\n'
                      'JULIA BRAMBATTI PEREIRA\n\n'
                      'LUÍS CARLOS G. L. FILHO\n\n'
                      'MAICON CASAGRANDA PINTO',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'PressStart2P',
                        fontSize: 12,
                        height: 1.8,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              const SizedBox(height: 62),
              MenuButton(
                texto: 'Voltar',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
