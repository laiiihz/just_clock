import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_clock/faces/just_clock_face.dart';
import 'package:just_clock/structure.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JUST CLOCK',
      theme: ThemeData.dark(),
      home: const StructureView(),
    );
  }
}
