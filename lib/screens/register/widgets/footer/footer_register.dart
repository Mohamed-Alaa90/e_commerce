import 'package:e_commerce/cubit/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widget/my_bottom.dart';

class FooterRegister extends StatelessWidget {
  const FooterRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {},
            child: const Text(
              'ForgotPassword ?',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(height: 20),
        MyBottom(
          text: 'Register',
          onPressed: context.read<AuthCubit>().register(),
        ),

        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const Text('You Have Account'),
            InkWell(
              onTap: () {},
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
