import 'package:flutter/material.dart';

import '../widgets/elevated_button_style_widget.dart';
import '../widgets/gesture_gradient_text_widget.dart';
import '../widgets/gesture_text_widget.dart';
import '../widgets/privacy_policy_text_widget.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 60, 0, 0),
                child: GestureText(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  text: 'Sign In',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: GestureGradientText(
                  onTap: () {},
                  text: 'Sign Up',
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 100, 32, 0),
                    child: Form(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Login',
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(50.0)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                          contentPadding: const EdgeInsets.only(left: 24),
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 24, 32, 0),
                    child: Form(
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(50.0)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                          contentPadding: const EdgeInsets.only(left: 24),
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 24, 32, 0),
                    child: Form(
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Verify Password',
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(50.0)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                          contentPadding: const EdgeInsets.only(left: 24),
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: SizedBox(
                      width: 260,
                      height: 50,
                      child: ElevatedButtonStyle(
                        text: 'Sign Up',
                        onPressed: () {},
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 60),
                    child: PrivacyPolicyText(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
