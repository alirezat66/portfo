import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'about_data.g.dart';

@JsonSerializable()
class AboutData extends Equatable {
  final Profile profile;
  final Statistics statistics;
  final List<WorkExperience> workExperience;
  final List<SocialLink> socialLinks;
  final List<SkillCategory> skillCategories;

  const AboutData({
    required this.profile,
    required this.statistics,
    required this.workExperience,
    required this.socialLinks,
    required this.skillCategories,
  });

  factory AboutData.fromJson(Map<String, dynamic> json) =>
      _$AboutDataFromJson(json);

  Map<String, dynamic> toJson() => _$AboutDataToJson(this);

  @override
  List<Object?> get props => [
        profile,
        statistics,
        workExperience,
        socialLinks,
        skillCategories,
      ];
}

@JsonSerializable()
class Profile extends Equatable {
  final String name;
  final String title;
  final String description;
  final String profileImagePath;
  final String profileImageHoverPath;
  final String availabilityStatus;

  const Profile({
    required this.name,
    required this.title,
    required this.description,
    required this.profileImagePath,
    required this.profileImageHoverPath,
    required this.availabilityStatus,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);

  @override
  List<Object?> get props => [
        name,
        title,
        description,
        profileImagePath,
        profileImageHoverPath,
        availabilityStatus,
      ];
}

@JsonSerializable()
class Statistics extends Equatable {
  final String experienceYears;
  final String projectsCount;

  const Statistics({
    required this.experienceYears,
    required this.projectsCount,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) =>
      _$StatisticsFromJson(json);

  Map<String, dynamic> toJson() => _$StatisticsToJson(this);

  @override
  List<Object?> get props => [experienceYears, projectsCount];
}

@JsonSerializable()
class WorkExperience extends Equatable {
  final String startYear;
  final String startMonth;
  final String endYear;
  final String endMonth;
  final String companyName;
  final String jobTitle;

  const WorkExperience({
    required this.startYear,
    required this.startMonth,
    required this.endYear,
    required this.endMonth,
    required this.companyName,
    required this.jobTitle,
  });

  factory WorkExperience.fromJson(Map<String, dynamic> json) =>
      _$WorkExperienceFromJson(json);

  Map<String, dynamic> toJson() => _$WorkExperienceToJson(this);

  @override
  List<Object?> get props => [
        startYear,
        startMonth,
        endYear,
        endMonth,
        companyName,
        jobTitle,
      ];
}

@JsonSerializable()
class SocialLink extends Equatable {
  final String name;
  final String url;
  final String iconPath;
  final String tooltip;

  const SocialLink({
    required this.name,
    required this.url,
    required this.iconPath,
    required this.tooltip,
  });

  factory SocialLink.fromJson(Map<String, dynamic> json) =>
      _$SocialLinkFromJson(json);

  Map<String, dynamic> toJson() => _$SocialLinkToJson(this);

  @override
  List<Object?> get props => [name, url, iconPath, tooltip];
}

@JsonSerializable()
class SkillCategory extends Equatable {
  final String category;
  final String categoryIcon;
  final List<Skill> skills;

  const SkillCategory({
    required this.category,
    required this.categoryIcon,
    required this.skills,
  });

  factory SkillCategory.fromJson(Map<String, dynamic> json) =>
      _$SkillCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$SkillCategoryToJson(this);

  @override
  List<Object?> get props => [category, categoryIcon, skills];
}

@JsonSerializable()
class Skill extends Equatable {
  final String name;
  final String? icon;

  const Skill({
    required this.name,
    this.icon,
  });

  factory Skill.fromJson(Map<String, dynamic> json) => _$SkillFromJson(json);

  Map<String, dynamic> toJson() => _$SkillToJson(this);

  @override
  List<Object?> get props => [name, icon];
}
