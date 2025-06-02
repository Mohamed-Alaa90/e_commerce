import 'package:e_commerce/screens/auth/register/body_register.dart';
import 'package:e_commerce/screens/auth/register/footer_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widget/header_pages.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import '../login/login_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static const String route = 'Register';

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
                    key: cubit.authControllers.registerFormKey,
                    child: const Column(
                      children: [
                        HeaderPages(title: 'Register'),
                        SizedBox(height: 30),
                        BodyRegister(),
                        SizedBox(height: 30),
                        FooterRegister(),
                      ],
                    ),
                  ),
                ),
              ),
              if (state is LoadingRegisterState)
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
          if (state is SuccessRegisterState) {
            context.read<AuthCubit>().clearControllers();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.green,
                content: Text('Success'),
              ),
            );
            Navigator.pushReplacementNamed(context, LoginPage.route);
          }
          if (state is ErrorRegisterState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.errorMessage),
              ),
            );
          }
        },
      ),
    );
  }
}
