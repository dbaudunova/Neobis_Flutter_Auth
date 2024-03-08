import 'package:flutter/material.dart';
import 'package:neobis_flutter_auth/data/key_store.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/elevated_button_style_widget.dart';
import '../widgets/gesture_gradient_text_widget.dart';
import '../widgets/gesture_text_widget.dart';
import '../widgets/privacy_policy_text_widget.dart';
import 'package:neobis_flutter_auth/widgets/text_form_field_style_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? login, password, verifyPassword;

  final _loginKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
  final _verifyPasswordKey = GlobalKey<FormState>();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController verifyPasswordController = TextEditingController();

  Future _setUserLogin() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(KeyStore.userLogin, loginController.text);
  }

  Future _setUserPassword() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(KeyStore.userPassword, passwordController.text);
  }

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    verifyPasswordController.dispose();
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
                      key: _loginKey,
                      child: TextFormFieldStyle(
                        hintText: 'Login',
                        controller: loginController,
                        validator: (val) {
                          if (val!.isEmpty) return 'Please enter your login';
                          return null;
                        },
                        obscureText: false,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 24, 32, 0),
                    child: Form(
                      key: _passwordKey,
                      child: TextFormFieldStyle(
                        controller: passwordController,
                        obscureText: true,
                        hintText: 'Password',
                        validator: (val) {
                          if (val!.isEmpty) return 'Please enter your password';
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 24, 32, 0),
                    child: Form(
                      key: _verifyPasswordKey,
                      child: TextFormFieldStyle(
                        controller: verifyPasswordController,
                        obscureText: true,
                        hintText: 'Verify Password',
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please repeat your password';
                          }
                          return null;
                        },
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
                        onPressed: () {
                          _loginKey.currentState?.validate();
                          _passwordKey.currentState?.validate();
                          _verifyPasswordKey.currentState?.validate();
                          /*_setUserLogin();
                          _setUserPassword();*/
                        },
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
