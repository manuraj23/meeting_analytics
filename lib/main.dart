import 'package:flutter/material.dart';
import 'screens/speech_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Speech to Text',
      theme: ThemeData.light(),  // Light Theme
      darkTheme: ThemeData.dark(),  // Dark Theme
      themeMode: ThemeMode.system,  // Auto-switch based on system settings
      home: SpeechToTextScreen(),
    );
  }
}
