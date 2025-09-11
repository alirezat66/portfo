import 'package:flutter/material.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import 'package:portfolio/widgets/responsive_content.dart';

class YearsToggle extends StatelessWidget {
  final List<int> years;
  final int selectedYear;
  final Function(int) onYearSelected;

  const YearsToggle({
    super.key,
    required this.years,
    required this.selectedYear,
    required this.onYearSelected,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Years',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 16),
              ...years.map((year) => _buildYearButton(context, year)),
            ],
          )
        ;
  }

  Widget _buildYearButton(BuildContext context, int year) {
    final isSelected = year == selectedYear;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () => onYearSelected(year),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: context.isDesktop ? double.infinity : 120,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: isSelected
                ? context.basicColors.surfaceBrandColor.withValues(alpha: 0.2)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected
                  ? context.basicColors.surfaceBrandColor
                  : Colors.grey[700]!,
              width: 1,
            ),
          ),
          child: Center(
            child: Text(
              year.toString(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: isSelected
                        ? context.basicColors.surfaceBrandColor
                        : Colors.grey[300],
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
