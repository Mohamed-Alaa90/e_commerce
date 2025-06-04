import 'package:e_commerce/pages/screens/category/category_screen.dart';
import 'package:e_commerce/pages/screens/favoret/favoret_screen.dart';
import 'package:e_commerce/pages/screens/home/home.dart';
import 'package:e_commerce/pages/screens/main/main.dart';
import 'package:e_commerce/pages/screens/profile/profile.dart';
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
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Main.route,
        routes: {
          Home.route: (context) => Home(),
          Main.route: (context) => Main(),
          Profile.route: (context) => Profile(),
          FavoretScreen.route: (context) => FavoretScreen(),
          CategoryScreen.route: (context) => CategoryScreen(),
        },
      ),
    );
  }
}
