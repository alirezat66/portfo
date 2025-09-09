import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import 'package:portfolio/features/about/view/about_section.dart';
import 'package:portfolio/features/companies/company_list_view.dart';
import 'package:portfolio/features/home/spotlight/spotlight_view.dart';
import 'package:portfolio/features/projects/widgets/latest_projects_section.dart';
import 'package:portfolio/features/testimonial/view/testimonial_section.dart';
import 'package:portfolio/features/articles/widgets/latest_articles_section.dart';
import 'package:portfolio/widgets/responsive_content.dart';
import '../../../core/di/service_locator.dart';
import '../../navigation/view_model/bloc/navigation_cubit.dart';
import '../../navigation/view/widgets/app_navigation_bar.dart';
import '../../navigation/view/widgets/mobile_menu_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<NavigationCubit>(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      appBar: const AppNavigationBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
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
                ],
              ),
            ),
          ),
          const MobileMenuDrawer(),
        ],
      ),
    );
  }
}
