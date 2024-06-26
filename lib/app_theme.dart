import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFFB7935F);
  static const Color blackColor = Color(0xFF242424);
  static const Color primaryDarkColor = Color(0xFF141A2E);
  static const Color yellowColor = Color(0xFFFACC1D);
  static const Color whiteColor = Color(0xFFF8F8F8);

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: TextTheme(
      displaySmall: GoogleFonts.elMessiri(fontSize: 28, color: blackColor,fontWeight: FontWeight.w600),
      displayLarge: GoogleFonts.elMessiri(fontSize: 28, color: primaryColor,fontWeight: FontWeight.w600),
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
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: primaryColor,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      unselectedItemColor: whiteColor,
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

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: TextTheme(
      displaySmall: GoogleFonts.elMessiri(fontSize: 28, color: whiteColor,fontWeight: FontWeight.w600),
      displayLarge: GoogleFonts.elMessiri(fontSize: 28, color: yellowColor,fontWeight: FontWeight.w600),
      headlineLarge: GoogleFonts.elMessiri(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: whiteColor,
      ),
      bodyLarge: GoogleFonts.elMessiri(
        fontWeight: FontWeight.w600,
        fontSize: 25,
        color: whiteColor,
      ),
      bodyMedium: GoogleFonts.inter(
          fontSize: 25, color: whiteColor, fontWeight: FontWeight.w400),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: primaryDarkColor,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      unselectedItemColor: Color(0xFFF8F8F8),
      selectedItemColor: yellowColor,
      selectedLabelStyle: TextStyle(fontSize: 14, color: blackColor),
      elevation: 0,
    ),
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: GoogleFonts.elMessiri(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}
