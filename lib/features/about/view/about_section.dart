import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/di/service_locator.dart';
import 'package:portfolio/core/view/widgets/section_widget.dart';
import 'package:portfolio/features/about/view/views/about_me_view.dart';
import 'package:portfolio/features/about/view/views/experience_view.dart';
import 'package:portfolio/features/about/view/views/experience_years.dart';
import 'package:portfolio/features/about/view/views/skill/skill_view.dart';
import 'package:portfolio/features/about/view/views/social_view.dart';
import 'package:portfolio/features/about/view/views/work_experience_view.dart';
import 'package:portfolio/features/about/view_model/about_cubit.dart';
import 'package:portfolio/features/github_calendar/view/github_history_section.dart';
import 'package:portfolio/widgets/responsive_content.dart';

class AboutSection extends StatelessWidget {
  final bool isHomePage;
  const AboutSection({super.key, this.isHomePage = true});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AboutCubit>()..loadAboutData(),
      child: AboutSectionContent(isHomePage: isHomePage),
    );
  }
}

class AboutSectionContent extends StatelessWidget {
  final bool isHomePage;
  const AboutSectionContent({super.key, this.isHomePage = true});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutCubit, AboutState>(
      builder: (context, state) {
        if (state is AboutLoading) {
          return const SizedBox(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is AboutError) {
          return SizedBox(
            height: 200,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: ${state.message}'),
                  ElevatedButton(
                    onPressed: () =>
                        context.read<AboutCubit>().refreshAboutData(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        }

        if (state is AboutLoaded) {
          return SectionWidget(
            title: !isHomePage ? null : 'About Me',
            child: context.isDesktop || context.isLaptop
                ? _buildDesktopAndLaptop(context, state.aboutData)
                : _buildTabletMobile(context, state.aboutData),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildDesktopAndLaptop(BuildContext context, aboutData) {
    return Column(
      spacing: 24,
      children: [
        IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 24,
            children: [
              Expanded(
                flex: 1,
                child: ExperienceView(aboutData: aboutData),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 12,
                        children: [
                          if (context.isDesktop)
                            Expanded(
                              flex: 1,
                              child: SocialView(aboutData: aboutData),
                            ),
                          Expanded(
                            flex: 2,
                            child: AboutMeView(aboutData: aboutData),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SkillView(aboutData: aboutData),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const GitHubHistorySection(),
      ],
    );
  }

  Widget _buildTabletMobile(BuildContext context, aboutData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        AboutMeView(aboutData: aboutData),
        WorkExperienceView(aboutData: aboutData),
        IntrinsicHeight(
          child: Row(
            spacing: 12,
            children: [
              Expanded(child: ExperienceYears(aboutData: aboutData)),
              Expanded(child: SocialView(aboutData: aboutData)),
            ],
          ),
        ),
        SkillView(aboutData: aboutData),
        const GitHubHistorySection(),
      ],
    );
  }
}
