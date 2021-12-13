import 'package:flutter/material.dart';
import 'package:just_clock/faces/just_clock_face.dart';
import 'package:just_clock/faces/just_clock_tick_face.dart';

class StructureView extends StatefulWidget {
  const StructureView({Key? key}) : super(key: key);

  @override
  _StructureViewState createState() => _StructureViewState();
}

class _StructureViewState extends State<StructureView> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const [
        JustClockFace(),
        JustClockTickFace(),
      ],
    );
  }
}
