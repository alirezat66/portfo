import 'package:flutter/material.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import 'package:portfolio/features/about/models/work.dart';
import 'package:portfolio/features/about/view/widgets/work_summery_card.dart';

class WorkExperienceView extends StatelessWidget {
  const WorkExperienceView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.basicColors.backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        ...WorkModel.works.map((work) => WorkSummeryCard(work: work)),
      ]),
    );
  }
}
