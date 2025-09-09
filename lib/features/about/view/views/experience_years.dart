import 'package:flutter/material.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import 'package:portfolio/widgets/responsive_content.dart';

class ExperienceYears extends StatelessWidget {
  const ExperienceYears({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return context.isDesktop || context.isLaptop
        ? _buildDesktopWrapper(context)
        : _buildMobileWrapper(context);
  }
}

_buildMobileWrapper(BuildContext context) {
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
                '16+ Years',
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
                'Experience',
                style: TextStyle(
                  fontFamily: 'Zodiak',
                  fontSize: 14,
                  color: context.basicColors.textSecondaryColor,
                ),
              ),
              Text(
                '16+ Years',
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

Widget _buildDesktopWrapper(BuildContext context) {
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
                  '16+ Years',
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
                  '70+ Projects',
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
