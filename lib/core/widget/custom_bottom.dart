import 'package:animated_button/animated_button.dart';
import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:e_commerce/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({super.key, required this.text, required this.onPressed});

  final String text;

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      borderRadius: 16.r,
      //
      onPressed: onPressed,
      color: AppColors.lightColor,

      child: SizedBox(
        height: 45.h,
        width: double.infinity,
        // width: 343.w,
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.cairo(
              //
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
