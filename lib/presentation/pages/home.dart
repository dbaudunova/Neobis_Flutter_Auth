import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Image(
          image: AssetImage('assets/cat_in_glasses.jpg'),
        ),
      ),
    );
  }
}
