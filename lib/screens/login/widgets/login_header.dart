import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        SizedBox(height: 16.h),
        Text(
          'Login',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: theme.primaryColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Welcome Back',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
            color: theme.primaryColor,
          ),
        ),
      ],
    );
  }
}
