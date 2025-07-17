import 'package:e_commerce/features/on_boarding/views/on_boarding_view.dart';
import 'package:flutter/material.dart';

import '../../features/auth/login/view/login_view.dart';
import '../../features/auth/register/view/register_view.dart';
import '../../features/home/view/home.dart';
import '../../features/splash/view/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (_) => const LoginView());
    case RegisterView.routeName:
      return MaterialPageRoute(builder: (_) => const RegisterView());
    case MainScreen.routeName:
      return MaterialPageRoute(builder: (_) => const MainScreen());
    // Add more routes here as needed
    default:
      return MaterialPageRoute(
        builder:
            (_) => const Scaffold(body: Center(child: Text('Page not found'))),
      );
  }
}
