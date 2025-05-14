import 'package:e_commerce/screens/login/screens/login_screen.dart';
import 'package:e_commerce/screens/main_screen/main_screen.dart';
import 'package:e_commerce/screens/register/screens/register_screen.dart';
import 'package:e_commerce/screens/splash/splash.dart';
import 'package:e_commerce/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeApp.lightTheme,
          initialRoute: SplashScreen.routeName,
          routes: {
            LoginScreen.routeName: (context) => LoginScreen(),
            RegisterScreen.routeName: (context) => RegisterScreen(),
            MainScreen.routeName: (context) => MainScreen(),
            SplashScreen.routeName : (context )=> SplashScreen(),
          },
        );
      },
    );
  }
}
