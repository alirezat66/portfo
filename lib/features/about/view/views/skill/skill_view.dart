import 'package:flutter/material.dart';
import 'package:portfolio/features/about/models/skill.dart';
import 'package:portfolio/features/about/view/views/skill/skill_category_view.dart';
import 'package:portfolio/widgets/responsive_content.dart';

class SkillView extends StatelessWidget {
  const SkillView({super.key});

  @override
  Widget build(BuildContext context) {
    return context.isDesktop || context.isLaptop
        ? _buildDesktopWrapper(context)
        : context.isTablet
            ? _buildTabletWrapper(context)
            : _buildMobileWrapper(context);
  }
}

_buildMobileWrapper(BuildContext context) {
  return Column(
    spacing: 16,
    children: [
      SizedBox(
        width: double.infinity,
        child:
            SkillCategoryView(category: SkillCategoryModel.mobileAndFrontend()),
      ),
      SizedBox(
        width: double.infinity,
        child: SkillCategoryView(category: SkillCategoryModel.backendAndData()),
      ),
      SizedBox(
        width: double.infinity,
        child: SkillCategoryView(
            category: SkillCategoryModel.architectureAndBestPractices()),
      ),
      SizedBox(
        width: double.infinity,
        child: SkillCategoryView(
            category: SkillCategoryModel.toolsAndProfessionalSkills()),
      ),
    ],
  );
}

_buildTabletWrapper(BuildContext context) {
  return Column(
    spacing: 16,
    children: [
      IntrinsicHeight(
        child: Row(
          spacing: 16,
          children: [
            Expanded(
                child: SkillCategoryView(
                    category: SkillCategoryModel.mobileAndFrontend())),
            Expanded(
                child: SkillCategoryView(
                    category: SkillCategoryModel.backendAndData())),
          ],
        ),
      ),
      IntrinsicHeight(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Expanded(
              child: SkillCategoryView(
                  category: SkillCategoryModel.architectureAndBestPractices())),
          Expanded(
              child: SkillCategoryView(
                  category: SkillCategoryModel.toolsAndProfessionalSkills())),
        ],
      ))
    ],
  );
}

_buildDesktopWrapper(BuildContext context) {
  return Column(
    spacing: 16,
    children: [
      IntrinsicHeight(
        child: Row(
          spacing: 16,
          children: [
            Expanded(
                child: SkillCategoryView(
                    category: SkillCategoryModel.mobileAndFrontend())),
            Expanded(
                child: SkillCategoryView(
                    category: SkillCategoryModel.backendAndData())),
          ],
        ),
      ),
      Expanded(
          child: Row(
        spacing: 16,
        children: [
          Expanded(
              child: SkillCategoryView(
                  category: SkillCategoryModel.architectureAndBestPractices())),
          Expanded(
              child: SkillCategoryView(
                  category: SkillCategoryModel.toolsAndProfessionalSkills())),
        ],
      ))
    ],
  );
}
/* 
class SkillView extends StatefulWidget {
  const SkillView({super.key});

  @override
  State<SkillView> createState() => _SkillViewState();
}

class _SkillViewState extends State<SkillView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.2, 1.0, curve: Curves.easeOut),
    ));

    _animationController.forward();
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
              padding: EdgeInsets.all(
                MediaQuery.of(context).size.width > 768 ? 32 : 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context),
                  SizedBox(
                      height:
                          MediaQuery.of(context).size.width > 768 ? 40 : 24),
                  _buildSkillsContent(context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Skills & Expertise',
          style: context.textTheme.headlineMedium?.copyWith(
            color: context.basicColors.textPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'A comprehensive overview of my technical skills and expertise across different domains',
          style: context.textTheme.bodyLarge?.copyWith(
            color: context.basicColors.textSecondaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buildSkillsContent(BuildContext context) {
    return Column(
      children: SkillCategory.values.asMap().entries.map((entry) {
        final index = entry.key;
        final category = entry.value;
        final skills = SkillData.getSkillsByCategory(category);
        return SkillCategoryWidget(
          category: category,
          skills: skills,
          index: index,
        );
      }).toList(),
    );
  }
}
 */
