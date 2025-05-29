import 'package:e_commerce/screens/auth/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../widget/my_bottom.dart';
import '../cubit/auth_cubit.dart';

class FooterRegister extends StatelessWidget {
  const FooterRegister({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context
        .read<AuthCubit>();
    return Column(
      children: [
        const SizedBox(height: 20),
        MyBottom(
          text: 'Register',
          onPressed: () {
            if (
                cubit.authControllers
                .registerFormKey
                .currentState!
                .validate()) {
              context.read<AuthCubit>().register();
            }
          },
        ),

        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const Text('You Have Account'),
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, LoginPage.route);
              },
              child: const Text(
                ' Login Now',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
