import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract class MyTheme {


  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.lightColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.white,
      titleTextStyle: GoogleFonts.cairo(
        color: AppColors.blackColor,
        fontSize: 19.sp,
        fontWeight: FontWeight.w700,
      ),
    ),
    textTheme: TextTheme(
      titleSmall: GoogleFonts.cairo(
        textStyle: TextStyle(
          color: AppColors.blackColor,
          fontSize: 23.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      titleMedium: GoogleFonts.cairo(
        color: const Color(0xff4E5556),
        fontSize: 13.sp,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: GoogleFonts.cairo(
        color: AppColors.blackColor,
        fontSize: 19.sp,
        fontWeight: FontWeight.w700,
      ),
      labelSmall: GoogleFonts.cairo(
        fontSize: 13.sp,
        fontWeight: FontWeight.w600,
      ),
      labelMedium: GoogleFonts.cairo(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
