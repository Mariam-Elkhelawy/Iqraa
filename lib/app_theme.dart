import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFFB7935F);
  static const Color blackColor = Color(0xFf242424);

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.elMessiri(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: blackColor,
      ),
      bodyLarge: GoogleFonts.elMessiri(
        fontWeight: FontWeight.w600,
        fontSize: 25,
        color: blackColor,
      ),
      bodyMedium: GoogleFonts.inter(
          fontSize: 25, color: blackColor, fontWeight: FontWeight.w400),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryColor,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      unselectedItemColor: Color(0xFFF8F8F8),
      selectedItemColor: blackColor,
      selectedLabelStyle: TextStyle(fontSize: 14, color: blackColor),
      elevation: 0,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: GoogleFonts.elMessiri(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: blackColor,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData();
}
