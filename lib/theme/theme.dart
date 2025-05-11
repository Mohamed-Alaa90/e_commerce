import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeApp {
  static Color primerColor = const Color(0xff6055D8);
  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      // /   centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(size: 20, color: Color(0xff7C7979)),
    ),
    //useMaterial3: false,
    primaryColor: primerColor,
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: primerColor,
      ),
      headlineMedium: GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: primerColor,
      ),
      headlineSmall: GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: primerColor,
      ),
      titleLarge: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        fontSize: 25,
        color: primerColor,
      ),
    ),
  );
}
