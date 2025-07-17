import 'package:flutter/material.dart';
import '../widget/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String routeName = 'Login';

  @override
  Widget build(BuildContext context) {
    return LoginViewBody();
  }
}

