import 'package:flutter/material.dart';

class ThemeApp {
  static Color primerColor = const Color(0xff6055D8);
  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        size: 20,
        color: Color(0xff7C7979)
      )
    ),
  );
}
