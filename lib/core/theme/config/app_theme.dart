// lib/core/theme/config/app_theme.dart

import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../cubit/theme_state.dart';

class AppTheme {
  // Step 1: Define color mappings
  static const Map<AppColorScheme, Color> _primaryColors = {
    AppColorScheme.blue: Colors.blue,
    AppColorScheme.green: Colors.green,
    AppColorScheme.purple: Colors.deepPurple,
    AppColorScheme.orange: Colors.deepOrange,
    AppColorScheme.red: Colors.red,
    AppColorScheme.veryDarkBlue: Color(0xff1F1D2B),
    AppColorScheme.softBlue: Color(0xff242634),
    AppColorScheme.blueAccent: Colors.blueAccent,
    AppColorScheme.black: Colors.black,
  };

  // Step 2: Light theme generator
  static ThemeData light(AppColorScheme colorScheme) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: Colors.white,

        primaryContainer: AppPrimaryColors.blueAccent,
        onPrimaryContainer: Colors.black,
        surface: Colors.white,
        onInverseSurface: Colors.white,
        onSurface: Colors.black,
      ),

      textTheme: GoogleFonts.montserratTextTheme(ThemeData.light().textTheme),
    );
  }

  // Step 3: Dark theme generator
  static ThemeData dark(AppColorScheme colorScheme) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: _primaryColors[colorScheme],
      colorScheme: ColorScheme.dark(
        primary: _primaryColors[colorScheme]!,
        secondary: _primaryColors[colorScheme]!,
        onSurface: Colors.white,
        primaryContainer: AppPrimaryColors.blueAccent,
        onPrimaryContainer: Colors.white,
        onInverseSurface: Colors.white,
        surface: _primaryColors[colorScheme]!,
      ),
      appBarTheme: AppBarTheme(backgroundColor: _primaryColors[colorScheme]),
      textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
    );
  }
}
