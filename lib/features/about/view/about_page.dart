import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/di/service_locator.dart';
import 'package:portfolio/features/about/view/about_section.dart';
import 'package:portfolio/features/about/view_model/about_cubit.dart';
import 'package:portfolio/features/navigation/view/widgets/app_navigation_bar.dart';
import 'package:portfolio/widgets/responsive_content.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AboutCubit>()..loadAboutData(),
      child: Scaffold(
        appBar: const AppNavigationBar(),
        body: ResponsiveContent(
          child: SingleChildScrollView(
            child: Column(
              spacing: 40,
              children: [
                // Header Section
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(48),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.3),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'About Me',
                        style:
                            Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 48,
                                ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Get to know more about my journey, skills, and experience',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.grey[400],
                              fontSize: 18,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                // About Section
                const AboutSection(
                  isHomePage: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
