import 'package:flutter/material.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import 'package:portfolio/widgets/responsive_content.dart';
import '../../model/data/github_activity.dart';

class ActivityGrid extends StatelessWidget {
  final List<GitHubActivity> activities;
  final int year;

  const ActivityGrid({
    super.key,
    required this.activities,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'GitHub Activity - $year',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 16),
        _buildActivityGrid(context),
      ],
    );
  }

  Widget _buildActivityGrid(BuildContext context) {
    // Create a map for quick lookup
    final activityMap = <String, GitHubActivity>{};
    for (final activity in activities) {
      final key =
          '${activity.date.year}-${activity.date.month.toString().padLeft(2, '0')}-${activity.date.day.toString().padLeft(2, '0')}';
      activityMap[key] = activity;
    }

    // GitHub starts from January 1st and shows 7 rows (one for each day of week)
    final startDate = DateTime(year, 1, 1);
    final endDate = DateTime(year, 12, 31);

    // Calculate the first day of the year and adjust to start from Sunday
    final firstDayOfYear =
        startDate.weekday % 7; // Convert Monday=1 to Sunday=0
    final adjustedStartDate =
        startDate.subtract(Duration(days: firstDayOfYear));

    // Calculate total days to show (including days before Jan 1st to fill the grid)
    final totalDays = endDate.difference(adjustedStartDate).inDays + 1;
    final weeks = (totalDays / 7).ceil();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Day labels column
          const SizedBox(width: 8),

          // Activity squares grid
          _buildActivitySquares(context, activityMap, adjustedStartDate, weeks),
        ],
      ),
    );
  }

  Widget _buildActivitySquares(BuildContext context,
      Map<String, GitHubActivity> activityMap, DateTime startDate, int weeks) {
    return Column(
      children: List.generate(7, (dayIndex) {
        return Row(
          children: List.generate(weeks, (weekIndex) {
            final currentDate =
                startDate.add(Duration(days: weekIndex * 7 + dayIndex));

            // Only show squares for the actual year
            if (currentDate.year != year) {
              return Container(
                width: context.isDesktop ? 18 : 14,
                height: context.isDesktop ? 18 : 14,
                margin: const EdgeInsets.all(1),
              );
            }

            final key =
                '${currentDate.year}-${currentDate.month.toString().padLeft(2, '0')}-${currentDate.day.toString().padLeft(2, '0')}';
            final activity = activityMap[key];

            return _buildActivitySquare(context, activity);
          }),
        );
      }),
    );
  }

  Widget _buildActivitySquare(BuildContext context, GitHubActivity? activity) {
    final level = activity?.level ?? 0;
    Color color;

    switch (level) {
      case 0:
        color = context.basicColors.surfaceTertiaryColor;
        break;
      case 1:
        color = context.basicColors.surfaceBrandColor
            .withValues(alpha: 0.3); // Dark green
        break;
      case 2:
        color = context.basicColors.surfaceBrandColor
            .withValues(alpha: 0.5); // Medium green
        break;
      case 3:
        color = context.basicColors.surfaceBrandColor
            .withValues(alpha: 0.7); // Bright green
        break;
      case 4:
        color = context.basicColors.surfaceBrandColor; // Lightest green
        break;
      default:
        color = Colors.grey[800]!;
    }

    return Tooltip(
      message: activity != null
          ? '${activity.count} contributions on ${_formatDate(activity.date)}'
          : 'No contributions on ${_formatDate(DateTime.now())}',
      child: Container(
        width: context.isDesktop ? 18 : 14,
        height: context.isDesktop ? 18 : 14,
        margin: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }
}
