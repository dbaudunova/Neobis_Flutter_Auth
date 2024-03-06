import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 60, 0, 0),
              child: GestureDetector(
                onTap: () {
                  // Add functionality here if needed
                },
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32),
              child: GestureDetector(
                onTap: () {
                  // Add functionality here if needed
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 72, 32 ,0),
              child: Form(
                child: TextFormField(
                  decoration: InputDecoration(hintText: 'Login',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(24.0)),
                  hintStyle: const TextStyle(backgroundColor: Colors.white)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
