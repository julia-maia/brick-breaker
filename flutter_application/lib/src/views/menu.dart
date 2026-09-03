import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../game/models/game_settings.dart';
import '../widgets/game_logo.dart';
import '../widgets/menu_button.dart';
import 'configuracoes.dart';
import 'desenvolvedores.dart';
import 'game_brick_breaker.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final GameSettings settings = GameSettings();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 35),

              const GameLogo(),

              const SizedBox(height: 65),

              MenuButton(
                texto: 'Iniciar',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => GameBrickBreaker(settings: settings),
                    ),
                  );
                },
              ),

              const SizedBox(height: 56),

              MenuButton(
                texto: 'Configurações',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Configuracoes(settings: settings),
                    ),
                  );
                },
              ),

              const SizedBox(height: 56),

              MenuButton(
                texto: 'Desenvolvedores',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const Desenvolvedores()),
                  );
                },
              ),

              const SizedBox(height: 56),

              MenuButton(
                texto: 'Sair',
                onPressed: () {
                  _mostrarConfirmacaoSaida(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _mostrarConfirmacaoSaida(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 280,
                height: 215,
                decoration: BoxDecoration(
                  color: const Color(0xFFD3D3D3),
                  borderRadius: BorderRadius.circular(48),
                  border: Border.all(color: Colors.black),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sair do jogo?',
                      style: TextStyle(
                        fontFamily: 'PressStart2P',
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),

                    SizedBox(height: 55),

                    Text(
                      'Deseja realmente sair?',
                      style: TextStyle(
                        fontFamily: 'PressStart2P',
                        fontSize: 9,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 60),

              MenuButton(
                texto: 'Sim',
                onPressed: () {
                  SystemNavigator.pop();
                },
              ),

              const SizedBox(height: 56),

              MenuButton(
                texto: 'Não',
                onPressed: () {
                  Navigator.pop(dialogContext);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
