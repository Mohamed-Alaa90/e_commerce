import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_theme.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.prefixText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.validator,
    required this.obscureText, this.keyboardType,
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? prefixText;
  final Widget? prefixIcon;
  final String? hintText;
  final Widget? suffixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      cursorColor: Colors.black,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintStyle: MyTheme.lightTheme.textTheme.titleMedium!.copyWith(
          color: const Color(0xff949D9E),
        ),
        filled: true,
        fillColor: const Color(0XFFF5F5F5),
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
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(4.0.r),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black12),
          borderRadius: BorderRadius.circular(4.0.r),
        ),
      ),
    );
  }
}
