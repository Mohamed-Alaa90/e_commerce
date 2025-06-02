import 'package:e_commerce/screens/auth/login/footer_login.dart';
import 'package:e_commerce/screens/main/main_page.dart';
import 'package:e_commerce/widget/header_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import 'body_login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const String route = 'Login';

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        builder: (context, state) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                    key: cubit.authControllers.loginFormKey,
                    child: const Column(
                      children: [
                        HeaderPages(title: 'Login'),
                        SizedBox(height: 30),
                        BodyLogin(),
                        SizedBox(height: 30),
                        FooterLogin(),
                      ],
                    ),
                  ),
                ),
              ),
              if (state is LoadingLoginState)
                Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                ),
            ],
          );
        },
        listener: (context, state) {
          if (state is SuccessLoginState) {
            cubit.clearControllers();

            Navigator.pushReplacementNamed(context, MainPage.route);
          }
          if (state is ErrorLoginState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showDialog(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: const Text("Error"),
                      content: Text((state).errorMessage),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("OK"),
                        ),
                      ],
                    ),
              );
            });
          }
        },
      ),
    );
  }
}
