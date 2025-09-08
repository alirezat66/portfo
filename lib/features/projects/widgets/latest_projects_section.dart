import 'package:flutter/material.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import 'package:portfolio/widgets/responsive_content.dart';
import '../models/project.dart';
import 'project_card.dart';

class LatestProjectsSection extends StatelessWidget {
  const LatestProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = Project.sampleProjects;

    return SizedBox(
      width: double.infinity,
      child: Column(
        spacing: 32,
        children: [
          // Section Title
          Text(
            'Selected Works',
            style: TextStyle(
              color: context.basicColors.textSecondaryColor,
              fontSize: 44,
              fontFamily: 'Zodiak',
              fontWeight: FontWeight.bold,
            ),
          ),

          // Underline

          // Projects Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: context.isDesktop || context.isLaptop ? 2 : 1,
              childAspectRatio: context.isDesktop || context.isLaptop
                  ? 580 / 479.5
                  : 438 / 362.5,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              return ProjectCard(project: projects[index]);
            },
          ),
          // See All Works Button
          ElevatedButton(
            onPressed: () {
              // Navigate to all projects page
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: const BorderSide(color: Color(0xFF404040), width: 1),
              ),
            ),
            child: const Text(
              'See All Works',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
