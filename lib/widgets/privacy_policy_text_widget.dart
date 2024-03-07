import 'package:flutter/material.dart';

class PrivacyPolicyText extends StatelessWidget {
  const PrivacyPolicyText({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return const Text(
      'Privacy Policy',
      style: TextStyle(
        color: Colors.lightBlue,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
