import 'package:flutter/material.dart';
import 'package:portfolio/core/view/widgets/section_widget.dart';
import 'package:portfolio/widgets/responsive_content.dart';
import '../models/project.dart';
import 'project_card.dart';

class LatestProjectsSection extends StatelessWidget {
  const LatestProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = Project.sampleProjects;

    return SectionWidget(
      title: 'Selected Works',
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: context.isDesktop || context.isLaptop ? 2 : 1,
          childAspectRatio:
              context.isDesktop || context.isLaptop ? 580 / 479.5 : 438 / 362.5,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return ProjectCard(project: projects[index]);
        },
      ),
    );
  }
}
