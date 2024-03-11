import 'package:flutter/material.dart';
import 'package:neobis_flutter_auth/presentation/pages/home.dart';
import 'package:neobis_flutter_auth/presentation/pages/sign_in.dart';
import 'package:neobis_flutter_auth/presentation/pages/sign_up.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      initialRoute: 'sign_in',
      routes: {
        'sign_in': (context) => const SignIn(),
        'sign_up': (context) => const SignUp(),
        'home': (context) => const Home(),
      },
    ),
  );
}
