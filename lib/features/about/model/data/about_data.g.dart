// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AboutData _$AboutDataFromJson(Map<String, dynamic> json) => AboutData(
      profile: Profile.fromJson(json['profile'] as Map<String, dynamic>),
      statistics:
          Statistics.fromJson(json['statistics'] as Map<String, dynamic>),
      workExperience: (json['workExperience'] as List<dynamic>)
          .map((e) => WorkExperience.fromJson(e as Map<String, dynamic>))
          .toList(),
      socialLinks: (json['socialLinks'] as List<dynamic>)
          .map((e) => SocialLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      skillCategories: (json['skillCategories'] as List<dynamic>)
          .map((e) => SkillCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AboutDataToJson(AboutData instance) => <String, dynamic>{
      'profile': instance.profile,
      'statistics': instance.statistics,
      'workExperience': instance.workExperience,
      'socialLinks': instance.socialLinks,
      'skillCategories': instance.skillCategories,
    };

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      name: json['name'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      profileImagePath: json['profileImagePath'] as String,
      profileImageHoverPath: json['profileImageHoverPath'] as String,
      availabilityStatus: json['availabilityStatus'] as String,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'description': instance.description,
      'profileImagePath': instance.profileImagePath,
      'profileImageHoverPath': instance.profileImageHoverPath,
      'availabilityStatus': instance.availabilityStatus,
    };

Statistics _$StatisticsFromJson(Map<String, dynamic> json) => Statistics(
      experienceYears: json['experienceYears'] as String,
      projectsCount: json['projectsCount'] as String,
    );

Map<String, dynamic> _$StatisticsToJson(Statistics instance) =>
    <String, dynamic>{
      'experienceYears': instance.experienceYears,
      'projectsCount': instance.projectsCount,
    };

WorkExperience _$WorkExperienceFromJson(Map<String, dynamic> json) =>
    WorkExperience(
      startYear: json['startYear'] as String,
      startMonth: json['startMonth'] as String,
      endYear: json['endYear'] as String,
      endMonth: json['endMonth'] as String,
      companyName: json['companyName'] as String,
      jobTitle: json['jobTitle'] as String,
    );

Map<String, dynamic> _$WorkExperienceToJson(WorkExperience instance) =>
    <String, dynamic>{
      'startYear': instance.startYear,
      'startMonth': instance.startMonth,
      'endYear': instance.endYear,
      'endMonth': instance.endMonth,
      'companyName': instance.companyName,
      'jobTitle': instance.jobTitle,
    };

SocialLink _$SocialLinkFromJson(Map<String, dynamic> json) => SocialLink(
      name: json['name'] as String,
      url: json['url'] as String,
      iconPath: json['iconPath'] as String,
      tooltip: json['tooltip'] as String,
    );

Map<String, dynamic> _$SocialLinkToJson(SocialLink instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'iconPath': instance.iconPath,
      'tooltip': instance.tooltip,
    };

SkillCategory _$SkillCategoryFromJson(Map<String, dynamic> json) =>
    SkillCategory(
      category: json['category'] as String,
      categoryIcon: json['categoryIcon'] as String,
      skills: (json['skills'] as List<dynamic>)
          .map((e) => Skill.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SkillCategoryToJson(SkillCategory instance) =>
    <String, dynamic>{
      'category': instance.category,
      'categoryIcon': instance.categoryIcon,
      'skills': instance.skills,
    };

Skill _$SkillFromJson(Map<String, dynamic> json) => Skill(
      name: json['name'] as String,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$SkillToJson(Skill instance) => <String, dynamic>{
      'name': instance.name,
      'icon': instance.icon,
    };
