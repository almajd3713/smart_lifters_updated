import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static const TextStyle primary = TextStyle(
    fontFamily: 'Poppins'
  );
  static const TextStyle secondary = TextStyle(
    fontFamily: 'LeagueSpartan'
  );

  static const TextTheme textScheme = TextTheme(
    headlineLarge: primary,
    headlineMedium: primary,
    headlineSmall: primary,

    bodyLarge: secondary,
    bodyMedium: secondary,
    bodySmall: secondary
  );
}