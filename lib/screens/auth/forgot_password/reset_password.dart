import 'package:e_commerce/screens/auth/cubit/auth_cubit.dart';
import 'package:e_commerce/screens/auth/cubit/auth_state.dart';
import 'package:e_commerce/service_locator.dart';
import 'package:e_commerce/widget/my_bottom.dart';
import 'package:e_commerce/widget/my_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});
  static const String route = 'ResetPassword';
  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)!.settings.arguments as String;
    return BlocProvider.value(
      value: getIt<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is ResetPasswordError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
          if (state is ResetPasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('تم تغيير كلمه المرور بنجاح')),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<AuthCubit>();
          return Scaffold(
            backgroundColor: Colors.white,

            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //
                      const SizedBox(height: 50),
                      const Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'Verify Code',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black38,
                          ),
                        ),
                      ),
                      const SizedBox(height: 100),
                      const Text(
                        'Your Email',
                        style: TextStyle(color: Colors.black87, fontSize: 15),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 400,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            email,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'New Password',
                        style: TextStyle(color: Colors.black87, fontSize: 15),
                      ),
                      const SizedBox(height: 10),
                      MyTextFormField(
                        controller: cubit.authControllers.newPasswordController,
                      ),
                      const SizedBox(height: 15),

                      Align(
                        alignment: Alignment.center,
                        child: MyBottom(
                          text: 'send',
                          onPressed: () => cubit.resetPassword(email),
                          
                        ),
                      ),
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
