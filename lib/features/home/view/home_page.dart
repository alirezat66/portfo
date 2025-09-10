import 'package:flutter/material.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import 'package:portfolio/features/about/view/about_section.dart';
import 'package:portfolio/features/companies/view/company_list_view.dart';
import 'package:portfolio/features/spotlight/view/spotlight_view.dart';
import 'package:portfolio/features/projects/widgets/latest_projects_section.dart';
import 'package:portfolio/features/testimonial/view/testimonial_section.dart';
import 'package:portfolio/features/articles/view/latest_articles_section.dart';
import 'package:portfolio/features/footer/view/footer_section.dart';
import 'package:portfolio/widgets/responsive_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.surface,
      child: SingleChildScrollView(
        child: ResponsiveContent(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 40,
            children: [
              const SpotlightView(),
              const CompanyListView(),
              const LatestProjectsSection(),
              const TestimonialView(),
              const LatestArticlesSection(),
              const AboutSection(),
              const FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}
