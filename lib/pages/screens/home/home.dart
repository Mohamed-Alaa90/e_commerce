import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static const String route = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
