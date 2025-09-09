import 'package:flutter/material.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import 'package:portfolio/features/about/view/views/about_me_view.dart';
import 'package:portfolio/features/about/view/views/experience_view.dart';
import 'package:portfolio/features/about/view/views/skill/skill_view.dart';
import 'package:portfolio/features/about/view/views/social_view.dart';
import 'package:portfolio/widgets/responsive_content.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      children: [
        Text(
          'About Me',
          style: TextStyle(
              color: context.basicColors.textSecondaryColor,
              fontSize: 44,
              fontFamily: 'Zodiak',
              fontWeight: FontWeight.bold),
        ),
        IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 24,
            children: [
              Expanded(
                flex: 1,
                child: ExperienceView(),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12,
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 12,
                        children: [
                          if (context.isDesktop)
                            Expanded(
                              flex: 1,
                              child: SocialView(),
                            ),
                          Expanded(
                            flex: 2,
                            child: AboutMeView(),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SkillView(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
