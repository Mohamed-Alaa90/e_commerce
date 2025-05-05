import 'package:e_commerce/widget/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key, required this.isLoading, required this.onTap});
  final bool isLoading;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child:
          isLoading
              ? LoadingAnimationWidget.staggeredDotsWave(
                color: theme.primaryColor,
                size: 50.0,
              )
              : MyButton(
                onTap: onTap,
                name: 'Login',
                color: theme.primaryColor,
                width: 300.w,
                height: 50.h,
              ),
    );
  }
}
