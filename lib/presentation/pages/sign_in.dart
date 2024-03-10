import 'package:flutter/material.dart';
import 'package:neobis_flutter_auth/data/key_store.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/elevated_button_style_widget.dart';
import '../widgets/gesture_gradient_text_widget.dart';
import '../widgets/gesture_text_widget.dart';
import '../widgets/text_form_field_style_widget.dart';
import 'package:neobis_flutter_auth/presentation/widgets/privacy_policy_text_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String? login, password;
  final _formKey = GlobalKey<FormState>();

  void _authorization(context) async {
    const snackBar =
    SnackBar(content: Text('Authorization completed successfully'));
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pushReplacementNamed(context, 'home');
    }
  }

  Future _getUserData() async {
    var prefs = await SharedPreferences.getInstance();
    login = prefs.getString(KeyStore.userLogin) ?? '';
    password = prefs.getString(KeyStore.userPassword) ?? '';
  }

  @override
  void initState() {
    super.initState();
    _getUserData();
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
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormFieldStyle(
                            hintText: 'Login',
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Please enter your login';
                              } else if (val != login) {
                                return 'Incorrect login';
                              }
                              return null;
                            },
                          ),
                          const Padding(padding: EdgeInsets.only(top: 24)),
                          TextFormFieldStyle(
                            obscureText: true,
                            hintText: 'Password',
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Please enter your password';
                              } else if (val != password) {
                                return 'Incorrect password';
                              }
                              return null;
                            },
                          ),
                        ],
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
                        onPressed: () {
                          _authorization(context);
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