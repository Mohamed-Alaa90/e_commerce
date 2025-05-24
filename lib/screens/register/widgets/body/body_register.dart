import 'package:e_commerce/cubit/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widget/my_text_form_field.dart';

class BodyRegister extends StatelessWidget {
  const BodyRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //
        MyTextFormField(
          controller: context.read<AuthCubit>().registerNameController,
          prefixIcon: const Icon(Icons.person),
          labelText: 'Name',
        ),

        const SizedBox(height: 10),

        MyTextFormField(
          controller: context.read<AuthCubit>().registerEmailController,
          prefixIcon: const Icon(Icons.email),
          labelText: 'Email',
        ),

        const SizedBox(height: 10),

        MyTextFormField(
          controller: context.read<AuthCubit>().registerPhoneController,
          prefixIcon: const Icon(Icons.phone),
          labelText: 'Phone',
        ),

        const SizedBox(height: 10),

        MyTextFormField(
          controller: context.read<AuthCubit>().registerPasswordController,
          prefixIcon: const Icon(Icons.password),
          labelText: 'Password',
        ),
        const SizedBox(height: 10),

        MyTextFormField(
          controller: context.read<AuthCubit>().registerRePasswordController,
          prefixIcon: const Icon(Icons.password),
          labelText: 'rePassword',
        ),
      ],
    );
  }
}
