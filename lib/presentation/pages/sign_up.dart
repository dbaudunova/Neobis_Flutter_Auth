import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/elevated_button_style_widget.dart';
import '../widgets/gesture_gradient_text_widget.dart';
import '../widgets/gesture_text_widget.dart';
import '../widgets/text_form_field_style_widget.dart';
import 'package:neobis_flutter_auth/presentation/widgets/privacy_policy_text_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late SharedPreferences _prefs;
  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  final _verifyPasswordController = TextEditingController();

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> _setData(context) async {
    final login = _loginController.text;
    final password = _passwordController.text;
    const snackBar =
        SnackBar(content: Text('Registration completed successfully'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    await _saveCredentials(login, password);
    Navigator.pushNamed(context, 'sign_in');
  }

  Future<void> _saveCredentials(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(username, password);
  }

  String? _nameValidate(String? value) {
    final login = _loginController.text;
    if (value!.isEmpty) {
      return 'Please enter your login';
    } else if (_prefs.containsKey(login)) {
      return 'This user already exists';
    }
    return null;
  }

  String? _passwordValidate(String? val) {
    if (val!.isEmpty) {
      return 'Please enter your password';
    } else if (val.length < 4) {
      return 'Password must contain more than 4 symbols';
    } else if (val != _verifyPasswordController.text ||
        val != _passwordController.text) {
      return 'Password mismatch';
    }
    return null;
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    _verifyPasswordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _initPrefs();
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
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 100, 32, 0),
                child: Form(
                  key: _formKey,
                  child: Column(children: [
                    TextFormFieldStyle(
                      hintText: 'Login',
                      controller: _loginController,
                      validator: (val) {
                        return _nameValidate(val);
                      },
                    ),
                    const Padding(padding: EdgeInsets.only(top: 24)),
                    TextFormFieldStyle(
                      controller: _passwordController,
                      obscureText: true,
                      hintText: 'Password',
                      validator: (val) {
                        return _passwordValidate(val);
                      },
                    ),
                    const Padding(padding: EdgeInsets.only(top: 24)),
                    TextFormFieldStyle(
                      controller: _verifyPasswordController,
                      obscureText: true,
                      hintText: 'Verify Password',
                      validator: (val) {
                        return _passwordValidate(val);
                      },
                    ),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Center(
                  child: SizedBox(
                    width: 260,
                    height: 50,
                    child: ElevatedButtonStyle(
                      text: 'Sign Up',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _setData(context);
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
