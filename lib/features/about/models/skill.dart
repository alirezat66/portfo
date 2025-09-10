// Temporary compatibility model for SkillCategoryModel
// This will be removed once all references are updated to use the new data structure

import 'package:portfolio/core/gen/assets.gen.dart';
import '../model/data/about_data.dart';

class SkillCategoryModel {
  final String category;
  final String categoryIcon;
  final List<Skill> skills;

  SkillCategoryModel({
    required this.category,
    required this.categoryIcon,
    required this.skills,
  });

  factory SkillCategoryModel.mobileAndFrontend() {
    return SkillCategoryModel(
      category: 'Mobile & Front-End',
      categoryIcon: Assets.icons.skills.code.path,
      skills: [
        // Languages
        Skill(name: 'Dart', icon: Assets.icons.skills.dart.path),
        Skill(name: 'Kotlin', icon: Assets.icons.skills.kotlin.path),
        Skill(name: 'Swift', icon: Assets.icons.skills.swift.path),
        Skill(name: 'TypeScript'),
        Skill(name: 'JavaScript'),

        // Frameworks & State Management
        Skill(name: 'Flutter', icon: Assets.icons.skills.flutter.path),
        const Skill(name: 'Bloc, Riverpod, Provider'),
        const Skill(name: 'GetIt, Hilt'),

        // Features & Concepts
        const Skill(name: 'Isolate & Event Loop'),
        const Skill(name: 'Streams & Futures'),
        const Skill(name: 'RxDart'),
        const Skill(name: 'Plugins & Packages'),
        const Skill(name: 'Animations'),
        const Skill(name: 'Render Objects'),
      ],
    );
  }

  factory SkillCategoryModel.backendAndData() {
    return SkillCategoryModel(
      category: 'Back-End & Data',
      categoryIcon: Assets.icons.skills.devOps.path,
      skills: [
        // Languages & Frameworks
        Skill(name: 'Java', icon: Assets.icons.skills.java.path),
        Skill(name: 'Node.js', icon: Assets.icons.skills.node.path),
        const Skill(name: 'Dart Backend'),

        // Databases & Storage
        const Skill(name: 'MSSQL'),
        const Skill(name: 'MongoDB'),
        const Skill(name: 'Hive'),
        const Skill(name: 'Isar'),
        const Skill(name: 'Sqfentity'),
        const Skill(name: 'Floor'),

        // APIs
        const Skill(name: 'REST'),
        const Skill(name: 'GraphQL'),
        const Skill(name: 'gRPC'),
        const Skill(name: 'SOAP'),
      ],
    );
  }

  factory SkillCategoryModel.architectureAndBestPractices() {
    return SkillCategoryModel(
      category: 'Architecture & Best Practices',
      categoryIcon: Assets.icons.skills.library.path,
      skills: [
        // Architectural Concepts
        const Skill(name: 'Clean, MVVM, DDD'),
        const Skill(name: 'SOLID'),
        const Skill(name: 'Clean Code'),
        const Skill(name: 'DRY'),
        const Skill(name: 'KISS'),
        const Skill(name: 'Design Patterns'),

        // Testing & CI/CD
        const Skill(name: 'TDD'),
        const Skill(name: 'E2E Tests'),
        const Skill(name: 'A/B Testing'),
        const Skill(name: 'Fluttium'),
        const Skill(name: 'Patrol'),
        const Skill(name: 'Codemagic'),
        const Skill(name: 'GitHub Actions'),
        Skill(name: 'Jenkins', icon: Assets.icons.skills.jenkins.path),
        const Skill(name: 'fastlane'),

        // Version Control
        Skill(name: 'GitHub', icon: Assets.icons.skills.github.path),
        Skill(name: 'GitLab', icon: Assets.icons.skills.gitlab.path),
        const Skill(name: 'Codecommit'),
      ],
    );
  }

  factory SkillCategoryModel.toolsAndProfessionalSkills() {
    return SkillCategoryModel(
      category: 'Tools & Professional Skills',
      categoryIcon: Assets.icons.skills.communication.path,
      skills: [
        // Tools
        Skill(name: 'Firebase', icon: Assets.icons.skills.firebase.path),
        const Skill(name: 'CLI Development'),
        const Skill(name: 'Tokens & Design Systems'),
        const Skill(name: 'Adobe XD'),
        Skill(name: 'Figma', icon: Assets.icons.skills.figma.path),
        const Skill(name: 'Rive'),
        const Skill(name: 'Usercentrics'),

        // Professional Skills
        const Skill(name: 'Teamwork'),
        const Skill(name: 'Problem-solving'),
        const Skill(name: 'Active learning'),
        const Skill(name: 'Mentorship'),
        const Skill(name: 'Creative'),
      ],
    );
  }
}
