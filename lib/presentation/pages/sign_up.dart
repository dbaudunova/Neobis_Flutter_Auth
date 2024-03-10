import 'package:flutter/material.dart';
import 'package:neobis_flutter_auth/data/key_store.dart';
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
  List<String> userList = [];

  final _formKey = GlobalKey<FormState>();

  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController verifyPasswordController =
  TextEditingController();

  Future _setUserData() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(KeyStore.userLogin, loginController.text);
    prefs.setString(KeyStore.userPassword, passwordController.text);
    userList.add(loginController.text);
    await prefs.setStringList(KeyStore.userList, userList);
  }

  Future _getUserList() async {
    var prefs = await SharedPreferences.getInstance();
    userList = prefs.getStringList(KeyStore.userList) ?? [];
  }

  void _register(context) async {
    const snackBar =
    SnackBar(content: Text('Registration completed successfully'));
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pushNamed(context, 'sign_in');
    }
    await _setUserData();
  }

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    verifyPasswordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _getUserList();
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
                      key: _formKey,
                      child: Column(children: [
                        TextFormFieldStyle(
                          hintText: 'Login',
                          controller: loginController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Please enter your login';
                            } else if (userList.contains(val)) {
                              loginController.clear();
                              return 'This user already exists';
                            }
                            return null;
                          },
                        ),
                        const Padding(padding: EdgeInsets.only(top: 24)),
                        TextFormFieldStyle(
                          controller: passwordController,
                          obscureText: true,
                          hintText: 'Password',
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Please enter your password';
                            } else if (val.length < 4) {
                              passwordController.clear();
                              return 'Password must contain more than 4 symbols';
                            }
                            return null;
                          },
                        ),
                        const Padding(padding: EdgeInsets.only(top: 24)),
                        TextFormFieldStyle(
                          controller: verifyPasswordController,
                          obscureText: true,
                          hintText: 'Verify Password',
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Please repeat your password';
                            } else if (val.length < 4) {
                              passwordController.clear();
                              return 'Password must contain more than 4 symbols';
                            } else if (val != passwordController.text) {
                              return 'Password mismatch';
                            }
                            return null;
                          },
                        ),
                      ]),
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
                          _register(context);
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