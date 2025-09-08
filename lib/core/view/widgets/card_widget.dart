import 'package:flutter/material.dart';
import 'package:portfolio/core/view/increase_hover_ext.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';

class CardWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double? borderRadius;
  final double? borderWidth;
  final Color? borderColor;
  const CardWidget(
      {super.key,
      required this.child,
      this.onTap,
      this.borderRadius,
      this.borderWidth,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Container(
        decoration: BoxDecoration(
          color: context.basicColors.backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 16),
          border: Border.all(
            color: borderColor ?? context.basicColors.surfaceBrandColor,
            width: borderWidth ?? 3,
          ),
        ),
        child: child,
      ),
    ).increaseSizeOnHover(1.04);
  }
}
