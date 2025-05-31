import 'package:e_commerce/screens/auth/cubit/auth_cubit.dart';
import 'package:e_commerce/screens/auth/cubit/auth_state.dart';
import 'package:e_commerce/screens/auth/forgot_password/reset_password.dart';
import 'package:e_commerce/service_locator.dart';
import 'package:e_commerce/widget/my_bottom.dart';
import 'package:e_commerce/widget/my_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyCodePage extends StatelessWidget {
  const VerifyCodePage({super.key});

  static const String route = 'VerifyCodePage';
  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)!.settings.arguments as String;

    return BlocProvider.value(
      value: getIt<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        builder: (context, state) {
          final cubit = context.read<AuthCubit>();
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text(
                'Verify Code',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black38,
                ),
              ),
              centerTitle: true,
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Form(
                    key: cubit.authControllers.verifyCodeFormKey,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          //
                          const SizedBox(height: 50),
                          Text('الرجاء ادخال الكود المرسل إلى $email'),
                          const SizedBox(height: 50),
                          MyTextFormField(
                            hintText: 'ENTER CODE',
                            controller:
                                cubit.authControllers.verifyCodeController,
                            keyboardType: TextInputType.number,

                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'الرجاء إدخال رمز التحقق';
                              }

                              if (!RegExp(r'^\d{6}$').hasMatch(value)) {
                                return 'الرمز يجب أن يحتوي على أرقام فقط';
                              }
                              return null; // valid
                            },
                          ),
                          const SizedBox(height: 50),
                          if (state is AuthCodeSentLoading)
                            const Center(child: CircularProgressIndicator())
                          else
                            Center(
                              child: MyBottom(
                                text: 'Send',
                                onPressed: () {
                                  if (cubit
                                      .authControllers
                                      .verifyCodeFormKey
                                      .currentState!
                                      .validate()) {
                                    cubit.verifyResetCode();
                                  }
                                },
                                color: Colors.purple,
                                borderRadius: 30,
                                height: 50,
                                width: 350,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (state is VerifyResetCodeLoading)
                  Container(
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
                  ),
              ],
            ),
          );
        },
        listener: (context, state) {
          if (state is VerifyResetCodeError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
          if (state is VerifyResetCodeSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Success')));
            Navigator.pushNamedAndRemoveUntil(
              context,
              ResetPassword.route,
              (route) => false,
              arguments:
                  context
                      .read<AuthCubit>()
                      .authControllers
                      .forgotPasswordController
                      .text
                      .trim(),
            );
          }
        },
      ),
    );
  }
}
