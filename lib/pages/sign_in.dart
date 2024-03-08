import 'package:flutter/material.dart';
import 'package:neobis_flutter_auth/widgets/text_form_field_style_widget.dart';
import '../widgets/elevated_button_style_widget.dart';
import '../widgets/gesture_gradient_text_widget.dart';
import '../widgets/gesture_text_widget.dart';
import '../widgets/privacy_policy_text_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _loginKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                child: GestureGradientText(
                  text: 'Sign In',
                  onTap: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: GestureText(
                  text: 'Sign Up',
                  onTap: () {
                    Navigator.pushNamed(context, 'sign_up');
                  },
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 100, 32, 0),
                    child: Form(
                      key: _loginKey,
                      child: TextFormFieldStyle(
                        controller: loginController,
                        hintText: 'Login',
                        obscureText: false,
                        validator: (val) {},
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 24, 32, 0),
                    child: Form(
                      key: _passwordKey,
                      child: TextFormFieldStyle(
                        obscureText: true,
                        hintText: 'Password',
                        controller: passwordController,
                        validator: (val) {},
                      ),
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 16, 32, 0),
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: SizedBox(
                      width: 260,
                      height: 50,
                      child: ElevatedButtonStyle(
                        text: 'Sign In',
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
