import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import '../../models/skill.dart';
import 'skill_chip.dart';

class SkillCategoryWidget extends StatefulWidget {
  final SkillCategoryModel categoryModel;
  final int index;

  const SkillCategoryWidget({
    super.key,
    required this.categoryModel,
    required this.index,
  });

  @override
  State<SkillCategoryWidget> createState() => _SkillCategoryWidgetState();
}

class _SkillCategoryWidgetState extends State<SkillCategoryWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    // Stagger the animation based on index
    Future.delayed(Duration(milliseconds: widget.index * 150), () {
      if (mounted) {
        _animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: Container(
              margin: const EdgeInsets.only(bottom: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCategoryHeader(context),
                  const SizedBox(height: 16),
                  _buildSkillsGrid(context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCategoryHeader(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: context.basicColors.surfaceBrandColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: SvgPicture.asset(
            widget.categoryModel.categoryIcon,
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(
              context.basicColors.surfaceBrandColor,
              BlendMode.srcIn,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          widget.categoryModel.category,
          style: context.textTheme.headlineSmall?.copyWith(
            color: context.basicColors.textPrimaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildSkillsGrid(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: widget.categoryModel.skills
          .map((skill) => SkillChip(skill: skill))
          .toList(),
    );
  }
}
