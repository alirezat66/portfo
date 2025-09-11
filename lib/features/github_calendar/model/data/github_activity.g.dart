// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GitHubActivity _$GitHubActivityFromJson(Map<String, dynamic> json) =>
    GitHubActivity(
      date: DateTime.parse(json['date'] as String),
      count: (json['count'] as num).toInt(),
      level: (json['level'] as num).toInt(),
    );

Map<String, dynamic> _$GitHubActivityToJson(GitHubActivity instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'count': instance.count,
      'level': instance.level,
    };

GitHubYearData _$GitHubYearDataFromJson(Map<String, dynamic> json) =>
    GitHubYearData(
      year: (json['year'] as num).toInt(),
      activities: (json['activities'] as List<dynamic>)
          .map((e) => GitHubActivity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GitHubYearDataToJson(GitHubYearData instance) =>
    <String, dynamic>{
      'year': instance.year,
      'activities': instance.activities,
    };
