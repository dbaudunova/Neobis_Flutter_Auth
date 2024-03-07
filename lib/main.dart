import 'package:flutter/material.dart';
import 'package:neobis_flutter_auth/pages/sign_in.dart';
import 'package:neobis_flutter_auth/pages/sign_up.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        initialRoute: 'sign_in',
        routes: {
          'sign_in': (context) => const SignIn(),
          'sign_up': (context) => const SignUp(),
        },
      ),
    );
