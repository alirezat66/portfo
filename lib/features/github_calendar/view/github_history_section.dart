import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/config/github_config.dart';
import 'package:portfolio/core/di/service_locator.dart';
import 'package:portfolio/features/github_calendar/view_model/github_calendar_cubit.dart';
import 'package:portfolio/features/github_calendar/view_model/github_calendar_state.dart';
import 'package:portfolio/widgets/responsive_content.dart';
import 'widgets/activity_grid.dart';
import 'widgets/years_toggle.dart';

class GitHubHistorySection extends StatelessWidget {
  const GitHubHistorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GitHubCalendarCubit>()
        ..loadGitHubHistory(GitHubConfig.defaultUsername),
      child: BlocBuilder<GitHubCalendarCubit, GitHubCalendarState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.hasError) {
            return Center(
              child: Column(
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: Colors.amber[300],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Failed to load GitHub history',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.amber[300],
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    state.errorMessage ?? 'Unknown error occurred',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.amber[400],
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          if (state.years.isEmpty) {
            return Center(
              child: Text(
                'No GitHub history available',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[400],
                    ),
              ),
            );
          }

          return Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 48,
            children: [
              // Years toggle column
              if (context.isDesktop || context.isLaptop)
                SizedBox(
                  width: 120,
                  child: YearsToggle(
                    years: state.availableYears,
                    selectedYear: state.selectedYear,
                    onYearSelected: (year) {
                      context.read<GitHubCalendarCubit>().selectYear(year);
                    },
                  ),
                ),

              // Activity grid column
              Expanded(
                child: ActivityGrid(
                  activities: state.selectedYearActivities,
                  year: state.selectedYear,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
