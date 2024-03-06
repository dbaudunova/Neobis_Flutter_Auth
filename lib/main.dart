import 'package:flutter/material.dart';
import 'package:neobis_flutter_auth/pages/sign_in.dart';

void main() =>
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const SignIn(),
    ));
