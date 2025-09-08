import 'package:flutter/material.dart';

class BasicColors extends ThemeExtension<BasicColors> {
  final Color primaryColor;
  final Color backgroundColor;
  final Color surfaceColor;
  final Color tertiaryColor;
  final Color textPrimaryColor;
  final Color textSecondaryColor;
  final Color textTertiaryColor;
  final Color surfaceInvert;
  final Color accentColor;
  final Color surfaceBrandColor;
  final Color surfaceBrandSecondary;
  final Color surfaceTertiaryColor;
  const BasicColors({
    required this.primaryColor,
    required this.backgroundColor,
    required this.surfaceColor,
    required this.tertiaryColor,
    required this.textPrimaryColor,
    required this.textSecondaryColor,
    required this.textTertiaryColor,
    required this.surfaceInvert,
    required this.accentColor,
    required this.surfaceBrandColor,
    required this.surfaceBrandSecondary,
    required this.surfaceTertiaryColor,
  });

  @override
  BasicColors copyWith({
    Color? primaryColor,
    Color? backgroundColor,
    Color? surfaceColor,
    Color? tertiaryColor,
    Color? textPrimaryColor,
    Color? textSecondaryColor,
    Color? textTertiaryColor,
    Color? surfaceInvert,
    Color? accentColor,
    Color? surfaceBrandColor,
    Color? surfaceBrandSecondary,
    Color? surfaceTertiaryColor,
  }) {
    return BasicColors(
      primaryColor: primaryColor ?? this.primaryColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      surfaceColor: surfaceColor ?? this.surfaceColor,
      tertiaryColor: tertiaryColor ?? this.tertiaryColor,
      textPrimaryColor: textPrimaryColor ?? this.textPrimaryColor,
      textSecondaryColor: textSecondaryColor ?? this.textSecondaryColor,
      textTertiaryColor: textTertiaryColor ?? this.textTertiaryColor,
      surfaceInvert: surfaceInvert ?? this.surfaceInvert,
      accentColor: accentColor ?? this.accentColor,
      surfaceBrandColor: surfaceBrandColor ?? this.surfaceBrandColor,
      surfaceBrandSecondary:
          surfaceBrandSecondary ?? this.surfaceBrandSecondary,
      surfaceTertiaryColor: surfaceTertiaryColor ?? this.surfaceTertiaryColor,
    );
  }

  @override
  BasicColors lerp(covariant BasicColors? other, double t) => this;
}
