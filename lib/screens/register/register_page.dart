import 'package:e_commerce/cubit/auth/auth_cubit.dart';
import 'package:e_commerce/screens/register/widgets/body/body_register.dart';
import 'package:e_commerce/screens/register/widgets/footer/footer_register.dart';
import 'package:e_commerce/screens/register/widgets/header/header_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widget/my_text_form_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static const String route = 'Register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: context.read<AuthCubit>().registerFormKey,
            child: const Column(
              children: [
                HeaderRegister(),
                SizedBox(height: 30),
                BodyRegister(),
                SizedBox(height: 30),
                FooterRegister(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
