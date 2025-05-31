import 'package:e_commerce/screens/auth/cubit/auth_cubit.dart';
import 'package:e_commerce/screens/auth/cubit/auth_state.dart';
import 'package:e_commerce/screens/auth/forgot_password/verify_code_page.dart';
import 'package:e_commerce/service_locator.dart';
import 'package:e_commerce/widget/my_bottom.dart';
import 'package:e_commerce/widget/my_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  static const String route = 'forgotPassword';

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<AuthCubit>(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Forgot Password',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black38,
            ),
          ),
        ),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthCodeSentSuccess) {
              context.read<AuthCubit>().clearControllers();
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showDialog(
                  context: context,
                  builder:
                      (context) => AlertDialog(
                        title: const Text('Success'),
                        content: const Text('تم ارسال الكود الي بريدك'),
                        actions: [
                          TextButton(
                            onPressed:
                                () => Navigator.pushNamed(
                                  context,
                                  VerifyCodePage.route,
                                  arguments:
                                      context
                                          .read<AuthCubit>()
                                          .authControllers
                                          .forgotPasswordController
                                          .text
                                          .trim(),
                                ),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                );
              });
            }

            if (state is AuthCodeSentError) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showDialog(
                  context: context,
                  builder:
                      (context) => AlertDialog(
                        title: const Text('Error'),
                        content: Text((state).errorMessage),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                );
              });
            }
          },
          builder: (context, state) {
            final cubit = BlocProvider.of<AuthCubit>(context);

            return Padding(
              padding: const EdgeInsets.all(30.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    const Text(
                      'Check Email',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                    const SizedBox(height: 30),
                    MyTextFormField(
                      controller:
                          cubit.authControllers.forgotPasswordController,
                      hintText: 'Enter Your Email',
                    ),
                    const SizedBox(height: 30),
                    if (state is AuthCodeSentLoading)
                      const Center(child: CircularProgressIndicator())
                    else
                      Center(
                        child: MyBottom(
                          text: 'Send',
                          onPressed: () => cubit.forgotPassword(),
                          color: Colors.purple,
                          borderRadius: 30,
                          height: 50,
                          width: 350,
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
