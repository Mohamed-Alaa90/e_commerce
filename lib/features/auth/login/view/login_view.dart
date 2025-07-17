import 'package:e_commerce/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String routeName = 'Login';

  @override
  Widget build(BuildContext context) {
    return LoginViewBody();
  }
}

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

bool _obscureText = true;
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

class _LoginViewBodyState extends State<LoginViewBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تسجيل الدخول')),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            //
            CustomTextFormField(
              hintText: 'البريد الإلكتروني',
              obscureText: false,
              controller: _emailController,
            ),
            SizedBox(height: 15.h),
            CustomTextFormField(
              hintText: 'كلمة المرور',
              obscureText: _obscureText,
              controller: _passwordController,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.prefixText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.validator,
    required this.obscureText,
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;

  final String? prefixText;
  final Widget? prefixIcon;
  final String? hintText;
  final Widget? suffixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF9FAFA),
        borderRadius: BorderRadius.circular(4.0.r),
      ),
      child: TextFormField(
        obscureText: obscureText,
        cursorColor: Colors.black,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          hintStyle: MyTheme.lightTheme.textTheme.titleMedium!.copyWith(
            color: const Color(0xff949D9E),
          ),
          prefixText: prefixText,
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          suffixIconColor: const Color(0XFFC9CECF),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black12),
            borderRadius: BorderRadius.circular(4.0.r),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black12),
            borderRadius: BorderRadius.circular(4.0.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black12),
            borderRadius: BorderRadius.circular(4.0.r),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(4.0.r),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black12),
            borderRadius: BorderRadius.circular(4.0.r),
          ),
        ),
      ),
    );
  }
}
