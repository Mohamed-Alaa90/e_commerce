import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onTap;

  const LoginButton({super.key, required this.isLoading, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Container(
        height: 60.h,
        width: 250.w,
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child:
              isLoading
                  ? LoadingAnimationWidget.hexagonDots(
                    color: Colors.white,
                    size: 30.0,
                  )
                  : AnimatedButton(
                    onPressed: onTap,
                    color: theme.primaryColor,
                    width: 250.w,
                    height: 50.h,
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 25.sp),
                    ),
                  ),
        ),
      ),
    );
  }
}
