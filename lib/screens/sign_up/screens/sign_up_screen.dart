import 'dart:developer';
import 'package:e_commerce/screens/sign_up/cubit/sign_up_cubit.dart';
import 'package:e_commerce/screens/sign_up/widgets/sign_up_button.dart';
import 'package:e_commerce/screens/sign_up/widgets/sign_up_footer.dart';
import 'package:e_commerce/screens/sign_up/widgets/sign_up_header.dart';
import 'package:e_commerce/screens/sign_up/widgets/sugin_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String routeName = 'signUp';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpCubit signUpCubit = SignUpCubit();
  bool isLoading = false;

  void _handleSignUp() {
    if (!signUpCubit.formKey.currentState!.validate()) return;

    setState(() => isLoading = true);
    Future.delayed(const Duration(seconds: 2), () {
      setState(() => isLoading = false);
      try {
        signUpCubit.signUp();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('success'),
            duration: Duration(seconds: 1),
            backgroundColor: Colors.green,
          ),
        );
        signUpCubit.signUp();
      } catch (e) {
        log(e.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0.w),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: signUpCubit.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //
                SizedBox(height: 150.h),
                const SignUpHeader(),
                SizedBox(height: 50.h),
                SignUpForm(
                  phoneNumberController: signUpCubit.phoneController,
                  userNameController: signUpCubit.userNameController,
                  emailController: signUpCubit.emailController,
                  passwordController: signUpCubit.emailController,
                ),
                SizedBox(height: 60.h),
                SignUpButton(isLoading: isLoading, onTap: _handleSignUp),
                SizedBox(height: 16.h),
                const SignUpFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
