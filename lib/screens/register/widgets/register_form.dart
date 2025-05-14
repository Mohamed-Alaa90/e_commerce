import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce/widget/my_text_form.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.userNameController,
    required this.phoneNumberController,
    required this.confirmPasswordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController userNameController;
  final TextEditingController phoneNumberController;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextForm(
          controller: widget.userNameController,
          labelText: "Name",
          prefixIcon: Icons.person,
          keyboardType: TextInputType.name,
          validator: (val) {
            if (val == null || val.trim().isEmpty) {
              return "Please enter your name";
            }
            if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(val.trim())) {
              return "Name must contain letters only";
            }
            if (val.trim().length < 3) {
              return "Name must be at least 3 characters";
            }
            return null;
          },
        ),
        SizedBox(height: 16.h),
        MyTextForm(
          controller: widget.phoneNumberController,
          labelText: "Phone Number",
          prefixIcon: Icons.phone,
          keyboardType: TextInputType.phone,
          validator: (val) {
            if (val == null || val.trim().isEmpty) {
              return "Please enter your phone number";
            }
            if (!RegExp(r"^01[0-2,5]{1}[0-9]{8}$").hasMatch(val.trim())) {
              return "Enter a valid Egyptian phone number";
            }
            return null;
          },
        ),
        SizedBox(height: 16.h),
        MyTextForm(
          controller: widget.emailController,
          labelText: "Email",
          prefixIcon: Icons.email,
          keyboardType: TextInputType.emailAddress,
          validator: (val) {
            if (val == null || val.trim().isEmpty) {
              return "Please enter your email";
            }
            if (!RegExp(
              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
            ).hasMatch(val.trim())) {
              return 'Enter a valid email address';
            }
            return null;
          },
        ),
        SizedBox(height: 16.h),
        MyTextForm(
          controller: widget.passwordController,
          labelText: "Password",
          prefixIcon: Icons.lock,
          suffixIcon:
              _obscurePassword ? Icons.visibility_off : Icons.visibility,
          obscureText: _obscurePassword,
          keyboardType: TextInputType.visiblePassword,
          onSuffixIconPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
          validator: (val) {
            if (val == null || val.isEmpty) {
              return "Please enter your password";
            }
            if (val.length < 6) {
              return "Password must be at least 6 characters";
            }
            if (!RegExp(r'^(?=.*[A-Z])(?=.*[0-9])').hasMatch(val)) {
              return "Password must contain at least 1 capital letter and 1 number";
            }
            return null;
          },
        ),        SizedBox(height: 16.h),

        MyTextForm(
          controller: widget.confirmPasswordController,
          labelText: "ConfirmPassword",
          prefixIcon: Icons.lock,
          suffixIcon:
              _obscurePassword ? Icons.visibility_off : Icons.visibility,
          obscureText: _obscurePassword,
          keyboardType: TextInputType.visiblePassword,
          onSuffixIconPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
          validator: (val) {
            if (val == null || val.isEmpty) {
              return "Please enter your password";
            }
            if (val != widget.passwordController.text) {
              return 'Passwords do not match';
            }

            return null;
          },
        ),
      ],
    );
  }
}
