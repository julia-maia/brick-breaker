import 'package:flutter/material.dart';

import '../game/models/game_settings.dart';
import '../widgets/game_logo.dart';
import '../widgets/menu_button.dart';
import '../widgets/opcao_button.dart';

class Configuracoes extends StatefulWidget {
  final GameSettings settings;

  const Configuracoes({super.key, required this.settings});

  @override
  State<Configuracoes> createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 35,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFD3D3D3),
                  borderRadius: BorderRadius.circular(48),
                  border: Border.all(color: Colors.black),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Configurações',
                      style: TextStyle(
                        fontFamily: 'PressStart2P',
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 40),

                    const Text(
                      'Cor dos tijolos',
                      style: TextStyle(
                        fontFamily: 'PressStart2P',
                        fontSize: 10,
                      ),
                    ),

                    const SizedBox(height: 25),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OpcaoButton(
                          texto: 'Cinza',
                          selecionado:
                              widget.settings.brickColor == BrickColor.grey,
                          onPressed: () {
                            setState(() {
                              widget.settings.brickColor = BrickColor.grey;
                            });
                          },
                        ),

                        const SizedBox(width: 20),

                        OpcaoButton(
                          texto: 'Preto',
                          selecionado:
                              widget.settings.brickColor == BrickColor.black,
                          onPressed: () {
                            setState(() {
                              widget.settings.brickColor = BrickColor.black;
                            });
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),

                    const Text(
                      'Tamanho dos tijolos',
                      style: TextStyle(
                        fontFamily: 'PressStart2P',
                        fontSize: 10,
                      ),
                    ),

                    const SizedBox(height: 25),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OpcaoButton(
                          texto: 'Pequeno',
                          selecionado:
                              widget.settings.brickSize == BrickSize.small,
                          onPressed: () {
                            setState(() {
                              widget.settings.brickSize = BrickSize.small;
                            });
                          },
                        ),

                        const SizedBox(width: 20),

                        OpcaoButton(
                          texto: 'Grande',
                          selecionado:
                              widget.settings.brickSize == BrickSize.large,
                          onPressed: () {
                            setState(() {
                              widget.settings.brickSize = BrickSize.large;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 60),

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
