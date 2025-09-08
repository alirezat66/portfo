import 'package:flutter/material.dart';
import 'package:portfolio/core/view/theme/basic_colors.dart';

extension ThemeContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  BasicColors get basicColors =>
      Theme.of(this).extension<BasicColors>()!;
}
