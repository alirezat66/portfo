import 'package:portfolio/core/gen/assets.gen.dart';

class SkillCategoryModel {
  final String category;
  final String categoryIcon;
  final List<Skill> skills;

  SkillCategoryModel({
    required this.category,
    required this.categoryIcon,
    required this.skills,
  });

  factory SkillCategoryModel.programming() {
    return SkillCategoryModel(
      category: 'Programming',
      categoryIcon: Assets.icons.skills.code.path,
      skills: [
        // Languages
        Skill(name: 'Dart', icon: Assets.icons.skills.dart.path),
        Skill(name: 'Java', icon: Assets.icons.skills.java.path),
        Skill(name: 'Kotlin', icon: Assets.icons.skills.kotlin.path),
        Skill(name: 'Swift', icon: Assets.icons.skills.swift.path),
        Skill(
          name: 'TypeScript',
        ),
        Skill(
          name: 'JavaScript',
        ),

        // Frameworks
        Skill(name: 'Flutter', icon: Assets.icons.skills.flutter.path),
        Skill(name: 'Node.js', icon: Assets.icons.skills.node.path),
        const Skill(name: 'Dart Backend'),
      ],
    );
  }

  factory SkillCategoryModel.approaches() {
    return SkillCategoryModel(
      category: 'Approaches',
      categoryIcon: Assets.icons.skills.architecture.path,
      skills: [
        // Architecture
        const Skill(name: 'Clean, MVVM, DDD'),
        const Skill(name: 'SOLID'),
        const Skill(name: 'Clean Code'),
        const Skill(name: 'DRY'),
        const Skill(name: 'KISS'),
        const Skill(name: 'Design Patterns'),

        // Backend & APIs
        const Skill(name: 'REST'),
        const Skill(name: 'GraphQL'),
        const Skill(name: 'gRPC'),
        const Skill(name: 'SOAP'),
        Skill(name: 'Firebase', icon: Assets.icons.skills.firebase.path),

        // Databases
        const Skill(name: 'MSSQL'),
        const Skill(name: 'MongoDB'),
        const Skill(name: 'Hive'),
        const Skill(name: 'Isar'),
        const Skill(name: 'Sqfentity'),
        const Skill(name: 'Floor'),
        const Skill(name: 'TDD'),
        const Skill(name: 'E2E Tests'),
        const Skill(name: 'A/B Testing'),
      ],
    );
  }

  factory SkillCategoryModel.tools() {
    return SkillCategoryModel(
      category: 'Tools & DevOps',
      categoryIcon: Assets.icons.skills.devOps.path,
      skills: [
        // Testing
        const Skill(name: 'Fluttium'),
        const Skill(name: 'Patrol'),
        // CI/CD
        const Skill(name: 'Codemagic'),
        const Skill(
          name: 'GitHub Actions',
        ),
        Skill(name: 'Jenkins', icon: Assets.icons.skills.jenkins.path),
        const Skill(name: 'fastlane'),

        // Version Control
        Skill(name: 'GitHub', icon: Assets.icons.skills.github.path),
        Skill(name: 'GitLab', icon: Assets.icons.skills.gitlab.path),
        const Skill(name: 'Codecommit'),

        // Design & Other Tools
        const Skill(name: 'Adobe XD'),
        Skill(name: 'Figma', icon: Assets.icons.skills.figma.path),
        const Skill(name: 'Rive'),
        const Skill(name: 'Usercentrics'),
      ],
    );
  }

  factory SkillCategoryModel.flutter() {
    return SkillCategoryModel(
      category: 'Flutter',
      categoryIcon: Assets.icons.skills.library.path,
      skills: [
        const Skill(name: 'Bloc, Riverpod, Provider'),
        const Skill(name: 'GetIt, Hilt'),
        const Skill(name: 'Isolate & Event Loop'),
        const Skill(name: 'Streams & Futures'),
        const Skill(name: 'RxDart'),
        const Skill(name: 'Plugins & Packages'),
        const Skill(name: 'CLI Development'),
        const Skill(name: 'Animations'),
        const Skill(name: 'Render Objects'),
        const Skill(name: 'Tokens & Design Systems'),
      ],
    );
  }

  factory SkillCategoryModel.soft() {
    return SkillCategoryModel(
      category: 'Soft Skills',
      categoryIcon: Assets.icons.skills.communication.path,
      skills: [
        const Skill(name: 'Teamwork'),
        const Skill(name: 'Problem-solving'),
        const Skill(name: 'Active learning'),
        const Skill(name: 'Mentorship'),
        const Skill(name: 'Creative'),
      ],
    );
  }
}

class Skill {
  final String name;
  final String? icon;

  const Skill({
    required this.name,
    this.icon,
  });
}
