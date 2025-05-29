import 'package:e_commerce/screens/auth/forgot_password/forgot_password_page.dart';
import 'package:e_commerce/screens/auth/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../widget/my_bottom.dart';
import '../cubit/auth_cubit.dart';

class FooterLogin extends StatelessWidget {
  const FooterLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ForgotPasswordPage.route);
            },
            child: const Text(
              'ForgotPassword ?',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(height: 20),
        MyBottom(
          text: 'Login',
          onPressed: () {
            if (cubit.authControllers.loginFormKey.currentState!.validate()) {
              cubit.login();
            }
          },
        ),

        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const Text("Don't Have Account ?"),
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, RegisterPage.route);
              },
              child: const Text(
                ' Register Now',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
