import 'package:e_commerce/core/utils/shared_prefs_helper.dart';
import 'package:e_commerce/screens/auth/cubit/auth_cubit.dart';
import 'package:e_commerce/screens/auth/forgot_password/forgot_password_page.dart';
import 'package:e_commerce/screens/auth/forgot_password/reset_password.dart';
import 'package:e_commerce/screens/auth/login/login_page.dart';
import 'package:e_commerce/screens/auth/register/register_page.dart';
import 'package:e_commerce/screens/auth/forgot_password/verify_code_page.dart';
import 'package:e_commerce/screens/main/main_page.dart';
import 'package:e_commerce/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await SharedPrefsHelper.cacheInitializatin();
  runApp(
    BlocProvider(
      //
      create: (context) => getIt<AuthCubit>(),
      child: MyApp(),
    ),
  );
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
        theme: ThemeData(useMaterial3: true),
        initialRoute: LoginPage.route,
        routes: {
          MainPage.route: (context) => MainPage(),
          RegisterPage.route: (context) => RegisterPage(),
          LoginPage.route: (context) => LoginPage(),
          ForgotPasswordPage.route: (context) => ForgotPasswordPage(),
          VerifyCodePage.route: (context) => VerifyCodePage(),
          ResetPassword.route: (context) => ResetPassword(),
        },
      ),
    );
  }
}
