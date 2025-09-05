import 'package:flutter/material.dart';
import 'package:portfolio/core/view/theme/theme.dart';

extension ThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Color get surfaceBrandColor => AppTheme.surfaceBrandColor;
  Color get surfaceBrandSecondary => AppTheme.surfaceBrandSecondary;
}
