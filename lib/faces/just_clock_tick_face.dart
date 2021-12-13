import 'package:flutter/material.dart';
import 'package:just_clock/faces/tick_face_painter.dart';

class JustClockTickFace extends StatefulWidget {
  const JustClockTickFace({Key? key}) : super(key: key);

  @override
  _JustClockTickFaceState createState() => _JustClockTickFaceState();
}

class _JustClockTickFaceState extends State<JustClockTickFace> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
        height: size.height / 2,
        width: size.height / 2,
        child: CustomPaint(
          painter: TickFacePainter(),
        ),
      ),
    );
  }
}
