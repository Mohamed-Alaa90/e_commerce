import 'package:e_commerce/screens/auth/login/login_screen.dart';
import 'package:e_commerce/screens/home/home_screen.dart';
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
      designSize: const Size(360, 960),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeApp.lightTheme,
          initialRoute: LoginScreen.routeName,
          routes: {
            LoginScreen.routeName: (context) => LoginScreen(),
            HomeScreen.routeName: (context) => HomeScreen(),
          },
        );
      },
    );
  }
}
