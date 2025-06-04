import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  static const String route = 'Profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Profile'),
      ),
    );
  }
}
