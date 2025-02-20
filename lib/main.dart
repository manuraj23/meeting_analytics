import 'package:flutter/material.dart';
import 'screens/speech_screen.dart';

void main() {
  runApp(SpeechToTextApp());
}

class SpeechToTextApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SpeechToTextScreen(),
    );
  }
}
