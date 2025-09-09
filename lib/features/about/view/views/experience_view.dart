import 'package:flutter/material.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import 'package:portfolio/features/about/models/work.dart';
import 'package:portfolio/features/about/view/widgets/work_summery_card.dart';

class ExperienceView extends StatelessWidget {
  const ExperienceView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        Container(
          decoration: BoxDecoration(
            color: context.basicColors.backgroundColor,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            ...WorkModel.works.map((work) => WorkSummeryCard(work: work)),
          ]),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          spacing: 12,
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
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
                aspectRatio: 1,
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
        )
      ],
    );
  }
}
