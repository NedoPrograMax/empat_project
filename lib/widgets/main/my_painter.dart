import '../../core/utils.dart';
import 'package:flutter/material.dart';

class AppBarPainter extends CustomPainter {
  final Color paintColor;
  late final double secondHeightModifier;
  late final double firstHeightModifier;
  AppBarPainter(
    this.paintColor,
    double modifier,
  ) {
    secondHeightModifier = modifier.normalized(0, 1, 0.8, 1.4).toDouble();

    final tempFirst =
        secondHeightModifier.normalized(0.8, 1.4, 1, 1.6).toDouble();
    final difference = 1.6 - tempFirst;
    firstHeightModifier = 1 + difference;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = paintColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    final path = Path();
    path
      ..moveTo(0, size.height * 1.2)
      ..quadraticBezierTo(size.width * 0.2, size.height * firstHeightModifier,
          size.width * 0.4, size.height * 1.2)
      ..quadraticBezierTo(size.width * 0.7, size.height * secondHeightModifier,
          size.width, size.height * 1.2)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
