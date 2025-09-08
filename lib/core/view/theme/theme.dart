import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/view/theme/basic_colors.dart';

class AppTheme {
  static ThemeData get darkTheme {
    final basicColors = BasicColors(
      primaryColor: const Color(0xFF1A1A1A),
      backgroundColor: const Color(0xFF151515),
      surfaceColor: const Color(0xFF262626),
      tertiaryColor: const Color(0xFF525252),
      textPrimaryColor: const Color(0xFFFFFFFF),
      textSecondaryColor: const Color(0xFFA3A3A3),
      textTertiaryColor: const Color(0xFFF5F5F5),
      surfaceInvert: const Color(0xFFE5E5E5),
      accentColor: const Color(0xFF4A9EFF),
      surfaceBrandColor: const Color(0xFFFDBA72),
      surfaceBrandSecondary: const Color(0xFFB9925F),
    );
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      textTheme: GoogleFonts.nunitoTextTheme(
        ThemeData.dark().textTheme.copyWith(
              headlineLarge: GoogleFonts.nunito(
                color: basicColors.textPrimaryColor,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              headlineMedium: GoogleFonts.nunito(
                color: basicColors.textPrimaryColor,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              bodyLarge: GoogleFonts.nunito(
                color: basicColors.textPrimaryColor,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              bodyMedium: GoogleFonts.nunito(
                color: basicColors.textSecondaryColor,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
      ),
      colorScheme: ColorScheme.dark(
        primary: basicColors.primaryColor,
        surface: basicColors.surfaceColor,
        tertiary: basicColors.tertiaryColor,
        onPrimary: basicColors.textPrimaryColor,
        onSurface: basicColors.textSecondaryColor,
        onTertiary: basicColors.textTertiaryColor,
        inverseSurface: basicColors.surfaceInvert,
      ),
      scaffoldBackgroundColor: basicColors.backgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: GoogleFonts.nunito(
          color: basicColors.textPrimaryColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(color: basicColors.textPrimaryColor),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: basicColors.tertiaryColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: basicColors.textTertiaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: Color(0xFF404040), width: 1),
          ),
        ),
      ),
      extensions: [basicColors],
    );
  }
}
