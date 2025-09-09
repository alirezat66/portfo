import 'package:flutter/material.dart';
import 'package:portfolio/core/gen/assets.gen.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';

class AboutMeView extends StatelessWidget {
  const AboutMeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.basicColors.surfaceBrandColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            CircleAvatar(
              radius: 36,
              child: Image.asset(Assets.images.profileImageHover.path),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12,
              children: [
                Text(
                  'Reza Taghizadeh',
                  style: TextStyle(
                    fontFamily: 'Zodiak',
                    fontSize: 28,
                    color: context.basicColors.surfaceColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '''Senior Software Engineer, crafting scalable apps using robust architectures. Skilled in Android, iOA and Flutter, focusing on SOLID and test-driven development. Delivered apps with high-quality, adaptable code under tight deadlines.''',
                  style: TextStyle(
                    fontSize: 20,
                    color: context.basicColors.surfaceColor,
                  ),
                ),
              ],
            ))
          ]),
    );
  }
}
