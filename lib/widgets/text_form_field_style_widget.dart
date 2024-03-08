import 'package:flutter/material.dart';

class TextFormFieldStyle extends StatelessWidget {
  const TextFormFieldStyle({
    super.key,
    required this.hintText,
    required this.controller,
    required this.validator,
    required this.obscureText,
  });

  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(50.0)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0)),
        contentPadding: const EdgeInsets.only(left: 24),
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
