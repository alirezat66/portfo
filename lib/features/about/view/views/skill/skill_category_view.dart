import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import 'package:portfolio/features/about/model/data/about_data.dart';
import 'package:portfolio/features/about/view/widgets/skill_chip.dart';

class SkillCategoryView extends StatelessWidget {
  final SkillCategory category;
  const SkillCategoryView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.basicColors.backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        spacing: 16,
        children: [
          Row(
            spacing: 12,
            children: [
              SvgPicture.asset(
                category.categoryIcon,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                    context.colorScheme.onPrimary, BlendMode.srcIn),
              ),
              Text(
                category.category,
                style: context.textTheme.titleMedium!
                    .copyWith(color: context.colorScheme.onPrimary),
              ),
            ],
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (var skill in category.skills) SkillChip(skill: skill),
            ],
          )
        ],
      ),
    );
  }
}
