import 'package:e_commerce/cubit/auth/auth_cubit.dart';
import 'package:e_commerce/screens/main_page.dart';
import 'package:e_commerce/screens/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      //
      create: (context) => AuthCubit(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RegisterPage.route,
      routes: {
        MainPage.route: (context) => MainPage(),
        RegisterPage.route: (context) => RegisterPage(),
      },
    );
  }
}
