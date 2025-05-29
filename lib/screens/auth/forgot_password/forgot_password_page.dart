import 'package:e_commerce/screens/auth/cubit/auth_cubit.dart';
import 'package:e_commerce/screens/auth/cubit/auth_state.dart';
import 'package:e_commerce/screens/auth/verify_code_page.dart';
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
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthCodeSent) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('تم إرسال الكود بنجاح، تفقد بريدك')),
            );

            Navigator.pushNamed(context, VerifyCodePage.route, arguments:
            context.read<AuthCubit>().authControllers.forgotPasswordController.text.trim());
          }

          if (state is ErrorAuthState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<AuthCubit>();

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    'Forgot Password',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                  const SizedBox(height: 15),
                  MyTextFormField(
                    controller: cubit.authControllers.forgotPasswordController,
                    hintText: 'Enter Your Email',
                  ),
                  const SizedBox(height: 25),
                  if (state is LoadingAuthState)
                    const Center(child: CircularProgressIndicator())
                  else
                    Center(
                      child: MyBottom(
                        text: "Send",
                        onPressed: () => cubit.forgotPassword(),
                        color: Colors.purple,
                        borderRadius: 30,
                        height: 50,
                        width: 300,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
