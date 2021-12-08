import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_clock/just_clock_face.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JUST CLOCK',
      theme: ThemeData.dark(),
      home: const JustClockFace(),
    );
  }
}
