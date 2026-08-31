import 'package:flutter/material.dart';

class Brick {
  Rect rect;
  Color color;
  bool destroyed;

  Brick({required this.rect, required this.color, this.destroyed = false});
}
