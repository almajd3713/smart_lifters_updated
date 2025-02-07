

import 'package:flutter/material.dart';
import 'package:smart_lifters/src/app/theme/colors.dart';
import 'package:smart_lifters/src/app/theme/font.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    colorScheme: AppColors.lightScheme,
    textTheme: AppFonts.textScheme
  );

  static final ThemeData darkTheme = ThemeData(
    colorScheme: AppColors.darkScheme,
    textTheme: AppFonts.textScheme
  );
}