import 'dart:math';

import 'package:flutter/material.dart';

class TickFacePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    _renderFace(canvas, height, width);
  }

  void _renderFace(Canvas canvas, double height, double width) {
    Paint minutePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 12
      ..style = PaintingStyle.stroke;

    Paint secondPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke;
    for (var i = 0; i < 12; i++) {
      canvas.drawArc(
        Rect.fromCenter(
          center: Offset(height / 2, width / 2),
          width: width - 12,
          height: height - 12,
        ),
        pi * 2 / 12 * i,
        pi / 360,
        false,
        minutePaint,
      );
    }
    for (var i = 0; i < 60; i++) {
      canvas.drawArc(
        Rect.fromCenter(
          center: Offset(height / 2, width / 2),
          width: width,
          height: height,
        ),
        pi * 2 / 60 * i,
        pi / 360,
        false,
        secondPaint,
      );
    }
  }

  @override
  bool shouldRepaint(TickFacePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(TickFacePainter oldDelegate) => false;
}
