import 'package:flutter/material.dart';

class OpcaoButton extends StatelessWidget {
  final String texto;
  final bool selecionado;
  final VoidCallback onPressed;

  const OpcaoButton({
    super.key,
    required this.texto,
    required this.selecionado,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 105,
      height: 70,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: selecionado
              ? Colors.grey.shade500
              : Colors.grey.shade300,
          foregroundColor: Colors.black,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
            side: const BorderSide(color: Colors.black),
          ),
        ),
        child: Text(
          texto,
          style: const TextStyle(fontFamily: 'PressStart2P', fontSize: 11),
        ),
      ),
    );
  }
}
