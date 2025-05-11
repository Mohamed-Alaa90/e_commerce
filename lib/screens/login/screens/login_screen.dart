import 'dart:developer';

import 'package:e_commerce/screens/login/cubit/login_cubit.dart';
import 'package:e_commerce/screens/login/cubit/login_states.dart';
import 'package:e_commerce/screens/login/widgets/login_button.dart';
import 'package:e_commerce/screens/login/widgets/login_footer.dart';
import 'package:e_commerce/screens/login/widgets/login_form.dart';
import 'package:e_commerce/screens/login/widgets/login_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const String routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
          } else if (state is LoginErrorState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error.toString())));
          }
        },
        builder: (context, state) {
          final loginCubit = context.read<LoginCubit>();

          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.0.w),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: loginCubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 150.h),
                      const LoginHeader(),
                      SizedBox(height: 50.h),
                      LoginForm(
                        emailController: loginCubit.emailController,
                        passwordController: loginCubit.passwordController,
                      ),
                      SizedBox(height: 60.h),
                      LoginButton(
                        isLoading: loginCubit.isLoading,
                        onTap: () {
                          if (loginCubit.formKey.currentState!.validate()) {}
                        },
                      ),
                      SizedBox(height: 20.h),
                      const LoginFooter(),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
