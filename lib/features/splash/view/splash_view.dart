import 'package:e_commerce/features/splash/widget/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  static const String routeName = 'Splash';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //
      body: SplashViewBody(),
    );
  }
}
