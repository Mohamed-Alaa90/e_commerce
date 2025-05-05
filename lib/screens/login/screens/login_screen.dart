import 'dart:developer';

import 'package:e_commerce/screens/login/widgets/login_button.dart';
import 'package:e_commerce/screens/login/widgets/login_footer.dart';
import 'package:e_commerce/screens/login/widgets/login_form.dart';
import 'package:e_commerce/screens/login/widgets/login_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _handleLogin() {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);
    Future.delayed(const Duration(seconds: 2), () {
      setState(() => isLoading = false);
      // navigate or show login success
      try {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('success'),
            duration: Duration(seconds: 1),
            backgroundColor: Colors.green,
          ),
        );
      } catch (e) {
        log(e.toString());
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0.w),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 150.h),
                const LoginHeader(),
                SizedBox(height: 50.h),
                LoginForm(
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
                SizedBox(height: 60.h),
                LoginButton(isLoading: isLoading, onTap: _handleLogin),
                SizedBox(height: 20.h),
                const LoginFooter(),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
