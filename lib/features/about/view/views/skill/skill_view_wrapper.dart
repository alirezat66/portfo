import 'package:flutter/material.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import 'skill_view.dart';

class SkillViewWrapper extends StatelessWidget {
  const SkillViewWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.basicColors.backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: context.basicColors.surfaceBrandColor.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: const SkillView(),
      ),
    );
  }
}
