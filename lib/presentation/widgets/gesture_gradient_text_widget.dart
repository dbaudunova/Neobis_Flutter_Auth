import 'package:flutter/material.dart';

import 'gradient_text_widget.dart';

class GestureGradientText extends StatelessWidget {
  const GestureGradientText({
    super.key, required this.text, required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: GradientText(
        text,
        style: const TextStyle(
          fontSize: 36,
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
        gradient: const LinearGradient(colors: [
          Colors.blueAccent,
          Colors.lightBlue,
        ]),
      ),
    );
  }
}
