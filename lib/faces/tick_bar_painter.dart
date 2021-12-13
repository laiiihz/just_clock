import 'package:flutter/widgets.dart';

enum TickBarType {
  second,
  minute,
  hour,
}

class TickBarPainter extends CustomPainter {
  final int value;
  final TickBarType type;
  const TickBarPainter({
    required this.value,
    required this.type,
  });
  @override
  void paint(Canvas canvas, Size size) {}

  @override
  bool shouldRepaint(TickBarPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(TickBarPainter oldDelegate) => false;
}
