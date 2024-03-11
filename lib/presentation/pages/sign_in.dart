import 'package:flutter/material.dart';
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
  late SharedPreferences _prefs;
  String? _login, _password;
  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String? _loginAndPasswordCorrection(String? val) {
    _login = _loginController.text;
    _password = _passwordController.text;
    if (val!.isEmpty) {
      return 'Please enter your credentials';
    } else if (!_prefs.containsKey(_login!)) {
      return 'User does not exist';
    } else if (_prefs.getString(_login!) != _password) {
      return 'Incorrect login or password';
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    _initPrefs();
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
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
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 100, 32, 0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormFieldStyle(
                        hintText: 'Login',
                        controller: _loginController,
                        validator: (val) {
                          return _loginAndPasswordCorrection(val);
                        },
                      ),
                      const Padding(padding: EdgeInsets.only(top: 24)),
                      TextFormFieldStyle(
                        controller: _passwordController,
                        obscureText: true,
                        hintText: 'Password',
                        validator: (val) {
                          return _loginAndPasswordCorrection(val);
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
                child: Center(
                  child: SizedBox(
                    width: 260,
                    height: 50,
                    child: ElevatedButtonStyle(
                      text: 'Sign In',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacementNamed(context, 'home');
                        }
                      },
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 60),
                child: Center(
                  child: PrivacyPolicyText(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
