import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static Color lightColor = const Color(0xff1B5E37);
  static Color blackColor = const Color(0xff242424);
  static Color goldColor = const Color(0xfff4a91f);

  static ThemeData lightTheme = ThemeData(
    primaryColor: lightColor,

    textTheme: TextTheme(
      titleSmall: GoogleFonts.cairo(
        textStyle: TextStyle(
          color: blackColor,
          fontSize: 23.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      titleMedium: TextStyle(
        color: blackColor,
        fontSize: 25.sp,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        color: blackColor,
        fontSize: 30.sp,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
