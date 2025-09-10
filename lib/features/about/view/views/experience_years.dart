import 'package:flutter/material.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import 'package:portfolio/features/about/model/data/about_data.dart';
import 'package:portfolio/widgets/responsive_content.dart';

class ExperienceYears extends StatelessWidget {
  final AboutData aboutData;

  const ExperienceYears({
    super.key,
    required this.aboutData,
  });

  @override
  Widget build(BuildContext context) {
    return context.isDesktop || context.isLaptop
        ? _buildDesktopWrapper(context, aboutData)
        : _buildMobileWrapper(context, aboutData);
  }
}

Widget _buildMobileWrapper(BuildContext context, AboutData aboutData) {
  return Column(
    mainAxisSize: MainAxisSize.max,
    spacing: 12,
    children: [
      Expanded(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: context.basicColors.backgroundColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 20,
            children: [
              Text(
                'Experience',
                style: TextStyle(
                  fontFamily: 'Zodiak',
                  fontSize: 14,
                  color: context.basicColors.textSecondaryColor,
                ),
              ),
              Text(
                aboutData.statistics.experienceYears,
                style: TextStyle(
                  fontFamily: 'Zodiak',
                  fontSize: 22,
                  color: context.basicColors.textPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      Expanded(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: context.basicColors.backgroundColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 20,
            children: [
              Text(
                'Projects',
                style: TextStyle(
                  fontFamily: 'Zodiak',
                  fontSize: 14,
                  color: context.basicColors.textSecondaryColor,
                ),
              ),
              Text(
                aboutData.statistics.projectsCount,
                style: TextStyle(
                  fontFamily: 'Zodiak',
                  fontSize: 22,
                  color: context.basicColors.textPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      )
    ],
  );
}

Widget _buildDesktopWrapper(BuildContext context, AboutData aboutData) {
  return Row(
    mainAxisSize: MainAxisSize.max,
    spacing: 12,
    children: [
      Expanded(
        child: AspectRatio(
          aspectRatio: context.isMobile || context.isTablet ? 1.8 : 1,
          child: Container(
            decoration: BoxDecoration(
              color: context.basicColors.backgroundColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 20,
              children: [
                Text(
                  'Experience',
                  style: TextStyle(
                    fontFamily: 'Zodiak',
                    fontSize: 14,
                    color: context.basicColors.textSecondaryColor,
                  ),
                ),
                Text(
                  aboutData.statistics.experienceYears,
                  style: TextStyle(
                    fontFamily: 'Zodiak',
                    fontSize: 22,
                    color: context.basicColors.textPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      Expanded(
        child: AspectRatio(
          aspectRatio: context.isMobile || context.isTablet ? 1.8 : 1,
          child: Container(
            decoration: BoxDecoration(
              color: context.basicColors.backgroundColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 20,
              children: [
                Text(
                  'Projects',
                  style: TextStyle(
                    fontFamily: 'Zodiak',
                    fontSize: 14,
                    color: context.basicColors.textSecondaryColor,
                  ),
                ),
                Text(
                  aboutData.statistics.projectsCount,
                  style: TextStyle(
                    fontFamily: 'Zodiak',
                    fontSize: 22,
                    color: context.basicColors.textPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    ],
  );
}
