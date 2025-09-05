import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF1A1A1A);
  static const Color backgroundColor = Color(0xFF151515);
  static const Color surfaceColor = Color(0xFF262626);
  static const Color tertiaryColor = Color(0xFF525252);
  static const Color textPrimaryColor = Color(0xFFFFFFFF);
  static const Color textSecondaryColor = Color(0xFFA3A3A3);
  static const Color textTertiaryColor = Color(0xFFF5F5F5);
  static const Color surfaceInvert = Color(0xFFE5E5E5);
  static const Color accentColor = Color(0xFF4A9EFF);
  static const Color surfaceBrandColor = Color(0xFFFDBA72);
  static const Color surfaceBrandSecondary = Color(0xFFB9925F);
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      textTheme: GoogleFonts.nunitoTextTheme(
        ThemeData.dark().textTheme.copyWith(
              headlineLarge: GoogleFonts.nunito(
                color: textPrimaryColor,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              headlineMedium: GoogleFonts.nunito(
                color: textPrimaryColor,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              bodyLarge: GoogleFonts.nunito(
                color: textPrimaryColor,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              bodyMedium: GoogleFonts.nunito(
                color: textSecondaryColor,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
      ),
      colorScheme: const ColorScheme.dark(
        primary: primaryColor,
        surface: surfaceColor,
        tertiary: tertiaryColor,
        onPrimary: textPrimaryColor,
        onSurface: textSecondaryColor,
        onTertiary: textTertiaryColor,
        inverseSurface: surfaceInvert,
      ),
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: GoogleFonts.nunito(
          color: textPrimaryColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: const IconThemeData(color: textPrimaryColor),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: tertiaryColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: textTertiaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: Color(0xFF404040), width: 1),
          ),
        ),
      ),
    );
  }
}
