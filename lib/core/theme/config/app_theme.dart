// lib/core/theme/config/app_theme.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movify/core/utils/app_colors.dart';

class AppTheme {
  // Step 2: Light theme generator
  static ThemeData light(Color colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    cardColor: Colors.grey.shade200,
    dialogTheme: const DialogThemeData(backgroundColor: Colors.white),
    colorScheme: ColorScheme.light(
      primary: Colors.white,

      primaryContainer: AppPrimaryColors.blueAccent,
      onPrimaryContainer: Colors.black,
      onInverseSurface: Colors.white,
    ),

    textTheme: GoogleFonts.montserratTextTheme(ThemeData.light().textTheme),
  );

  // Step 3: Dark theme generator
  static ThemeData dark(Color colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    dialogTheme: DialogThemeData(backgroundColor: AppPrimaryColors.dark),
    cardColor: Colors.grey.shade900,
    scaffoldBackgroundColor: colorScheme,

    colorScheme: ColorScheme.dark(
      primary: colorScheme,
      secondary: colorScheme,

      primaryContainer: AppPrimaryColors.blueAccent,
      onPrimaryContainer: Colors.white,
      onInverseSurface: Colors.white,
      surface: colorScheme,
    ),
    appBarTheme: AppBarTheme(backgroundColor: colorScheme),
    textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
  );
}
