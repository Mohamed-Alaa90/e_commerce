import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widget/my_text_form_field.dart';
import '../cubit/auth_cubit.dart';

class BodyRegister extends StatelessWidget {
  const BodyRegister({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();

    return Column(
      children: [
        MyTextFormField(
          controller: cubit.authControllers.registerNameController,
          prefixIcon: const Icon(Icons.person),
          labelText: 'Name',
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Name is required';
            }
            return null;
          },
        ),

        const SizedBox(height: 10),

        MyTextFormField(
          controller: cubit.authControllers.registerEmailController,
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
          controller: cubit.authControllers.registerPhoneController,
          prefixIcon: const Icon(Icons.phone),
          labelText: 'Phone',
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Phone is required';
            }
            if (!RegExp(r'^\d{10,15}$').hasMatch(value)) {
              return 'Enter a valid phone number';
            }
            return null;
          },
        ),

        const SizedBox(height: 10),

        MyTextFormField(
          controller: cubit.authControllers.registerPasswordController,
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

        const SizedBox(height: 10),

        MyTextFormField(
          controller: cubit.authControllers.registerRePasswordController,
          prefixIcon: const Icon(Icons.password),
          labelText: 'rePassword',
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Please confirm your password';
            }
            if (value != cubit.authControllers.registerPasswordController.text) {
              return 'Passwords do not match';
            }
            return null;
          },
        ),
      ],
    );
  }
}
