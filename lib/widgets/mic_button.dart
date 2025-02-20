import 'package:flutter/material.dart';

class MicButton extends StatelessWidget {
  final bool isListening;
  final VoidCallback onPressed;

  const MicButton({required this.isListening, required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: isListening ? 80 : 70,
        width: isListening ? 80 : 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isListening ? Colors.redAccent : Colors.blueAccent,
          boxShadow: [
            BoxShadow(
              color: isListening ? Colors.red.withOpacity(0.5) : Colors.blue.withOpacity(0.5),
              blurRadius: 15,
              spreadRadius: 3,
            ),
          ],
        ),
        child: Icon(
          isListening ? Icons.mic_off : Icons.mic,
          color: Colors.white,
          size: 36,
        ),
      ),
    );
  }
}
