import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../widget/my_text_form_field.dart';
import '../cubit/auth_cubit.dart';

class BodyLogin extends StatelessWidget {
  const BodyLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();

    return Column(
      children: [
        const SizedBox(height: 10),

        MyTextFormField(
          controller: cubit.authControllers.loginEmailController,
          prefixIcon: const Icon(Icons.email),
          labelText: 'Email',
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Email is required';
            }
            if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
              return 'Enter a valid email';
            }
            return null;
          },
        ),

        const SizedBox(height: 10),

        MyTextFormField(
          controller: cubit.authControllers.loginPasswordController,
          prefixIcon: const Icon(Icons.password),
          labelText: 'Password',
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Password is required';
            }
            if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
        ),
      ],
    );
  }
}
