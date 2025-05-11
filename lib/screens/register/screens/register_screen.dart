import 'package:e_commerce/screens/register/cubit/register_cubit.dart';
import 'package:e_commerce/screens/register/cubit/register_states.dart';
import 'package:e_commerce/screens/register/widgets/register_button.dart';
import 'package:e_commerce/screens/register/widgets/register_footer.dart';
import 'package:e_commerce/screens/register/widgets/register_header.dart';
import 'package:e_commerce/screens/register/widgets/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  static const String routeName = 'register';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('register Success'),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state is RegisterErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error), backgroundColor: Colors.red),
            );
          }
        },
        builder: (context, state) {
          final signUpCubit = context.read<RegisterCubit>();
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
                      SizedBox(height: 100.h),
                      const RegisterHeader(),
                      SizedBox(height: 50.h),
                      RegisterForm(
                        phoneNumberController: signUpCubit.phoneController,
                        userNameController: signUpCubit.userNameController,
                        emailController: signUpCubit.emailController,
                        passwordController: signUpCubit.passwordController,
                        confirmPasswordController: signUpCubit.confirmPasswordController,
                      ),
                      SizedBox(height: 60.h),
                      RegisterButton(
                        isLoading: signUpCubit.isLoading,
                        onTap: () {
                          if (signUpCubit.formKey.currentState!.validate()) {
                            signUpCubit.register();
                          }
                        },
                      ),
                      SizedBox(height: 16.h),
                      const RegisterFooter(),
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
