import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 5;
    double dashSpace = 3;
    double arrowheadSize = 5; // Size of the arrowhead
    double startX = 0;
    final paint = Paint()
      ..color = AppColors.grey2.withOpacity(.5)
      ..strokeWidth = 1;

    while (startX < size.width - arrowheadSize) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
