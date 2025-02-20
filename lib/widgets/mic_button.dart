import 'package:flutter/material.dart';

class MicButton extends StatelessWidget {
  final bool isListening;
  final VoidCallback onPressed;

  const MicButton({required this.isListening, required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: isListening ? Colors.red : Colors.blue,
      child: Icon(isListening ? Icons.mic_off : Icons.mic, color: Colors.white),
    );
  }
}
