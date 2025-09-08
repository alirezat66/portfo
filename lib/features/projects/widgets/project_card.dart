import 'package:flutter/material.dart';
import 'package:portfolio/core/view/increase_hover_ext.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/project.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (project.projectUrl != null) {
          launchUrl(Uri.parse(project.projectUrl!));
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: context.basicColors.backgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: context.basicColors.surfaceBrandColor,
            width: 3,
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(project.imageUrl, fit: BoxFit.cover),
            )),
            if (project.tags.isNotEmpty) ...[
              Positioned(
                top: 48,
                left: 48,
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: project.tags.map((tag) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: context.basicColors.backgroundColor
                            .withValues(alpha: 0.6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        tag,
                        style: const TextStyle(
                          color: Color(0xFFB3B3B3),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16),
            ],
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.1),
                      Colors.black.withValues(alpha: 0.4),
                      Colors.black.withValues(alpha: 0.5),
                      Colors.black.withValues(alpha: 0.7),
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(project.title,
                          style: context.textTheme.headlineMedium!.copyWith(
                            fontFamily: 'Zodiak',
                            fontSize: 24,
                            color: context.basicColors.textPrimaryColor,
                          )),
                      SizedBox(
                        height: 12,
                      ),
                      Text(project.description,
                          style: context.textTheme.bodyMedium!.copyWith(
                            fontSize: 18,
                            color: context.basicColors.textSecondaryColor,
                          )),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ), 
    ).increaseSizeOnHover(1.02);
  }
}
