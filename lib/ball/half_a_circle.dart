import 'dart:math';

import 'package:flutter/material.dart';

class HalfACircle extends CustomPainter {
  final double startDegree;
  final Color color;

  final painter = Paint();

  HalfACircle(this.startDegree, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    painter.color = color;
    final rect = Rect.fromCircle(
      center: Offset(size.height / 2, size.width / 2),
      radius: size.height / 2,
    );
    canvas.drawArc(
      rect,
      (0) * pi / 180,
      (180) * pi / 180,
      true,
      painter,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
