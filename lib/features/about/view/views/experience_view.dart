import 'package:flutter/material.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import 'package:portfolio/features/about/model/data/about_data.dart';
import 'package:portfolio/features/about/view/views/experience_years.dart';
import 'package:portfolio/features/about/view/widgets/work_summery_card.dart';

class ExperienceView extends StatelessWidget {
  final AboutData aboutData;

  const ExperienceView({
    super.key,
    required this.aboutData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: context.basicColors.backgroundColor,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              ...aboutData.workExperience
                  .map((work) => WorkSummeryCard(work: work)),
            ]),
          ),
        ),
        ExperienceYears(aboutData: aboutData)
      ],
    );
  }
}
