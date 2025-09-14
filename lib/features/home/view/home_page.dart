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
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.surface,
      child: WebSmoothScroll(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
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
      ),
    );
  }
}
