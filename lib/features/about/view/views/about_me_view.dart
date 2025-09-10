import 'package:flutter/material.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import 'package:portfolio/features/about/model/data/about_data.dart';

class AboutMeView extends StatelessWidget {
  final AboutData aboutData;

  const AboutMeView({
    super.key,
    required this.aboutData,
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
              child: Image.asset(aboutData.profile.profileImageHoverPath),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12,
              children: [
                Text(
                  aboutData.profile.name,
                  style: TextStyle(
                    fontFamily: 'Zodiak',
                    fontSize: 28,
                    color: context.basicColors.surfaceColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  aboutData.profile.description,
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
