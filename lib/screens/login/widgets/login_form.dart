import 'package:e_commerce/widget/my_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextForm(
          controller: widget.emailController,
          labelText: "email",
          prefixIcon: Icons.email,
          keyboardType: TextInputType.emailAddress,
          validator: (val) {
            if (val == null || val.isEmpty) {
              return "Please enter your email";
            }
            if (!val.contains('@')) {
              return 'Please enter a valid email address';
            }
            return null;
          },
        ),
        SizedBox(height: 16.h),
        MyTextForm(
          prefixIcon: Icons.password,
          controller: widget.passwordController,
          labelText: "password",
          keyboardType: TextInputType.visiblePassword,
          obscureText: _obscurePassword,
          onSuffixIconPressed: () {
            setState(() => _obscurePassword = !_obscurePassword);
          },
          suffixIcon:
              _obscurePassword ? Icons.visibility : Icons.visibility_off,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
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
