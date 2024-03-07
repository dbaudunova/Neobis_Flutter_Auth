import 'package:flutter/material.dart';

class ElevatedButtonStyle extends StatelessWidget {
  const ElevatedButtonStyle({
    super.key, required this.text, required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16),
      ),
    );
  }
}