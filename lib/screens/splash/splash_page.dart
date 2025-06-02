import 'dart:async';

import 'package:e_commerce/core/theme/my_colors.dart';
import 'package:e_commerce/screens/auth/cubit/auth_cubit.dart';
import 'package:e_commerce/screens/auth/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:e_commerce/screens/auth/login/login_page.dart';
import 'package:e_commerce/screens/home/home_page.dart'; // عدل حسب مسار الصفحة الرئيسية

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  static const route = '/splash';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() => _opacity = 1.0);
    });

    context.read<AuthCubit>().verifyToken();
  }

  Route _createFadeRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
      transitionDuration: const Duration(milliseconds: 800),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is VerifyTokenSuccess) {
          Timer(const Duration(milliseconds: 3500), () {
            Navigator.of(context).pushReplacement(_createFadeRoute(HomePage()));
          });
        } else if (state is VerifyTokenError) {
          Timer(const Duration(milliseconds: 3500), () {
            Navigator.of(
              context,
            ).pushReplacement(_createFadeRoute(LoginPage()));
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedOpacity(
                  opacity: _opacity,
                  duration: const Duration(seconds: 2),
                  child: Text(
                    'Fashion',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: MyColors.kprimerColors,
                      letterSpacing: 1.8,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Lottie.asset(
                  'assets/splash.json',
                  width: size.width * 0.5,
                  height: size.width * 0.5,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
