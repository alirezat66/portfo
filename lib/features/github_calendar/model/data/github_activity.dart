import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'github_activity.g.dart';

@JsonSerializable()
class GitHubActivity extends Equatable {
  final DateTime date;
  final int count;
  final int level; // 0-4 for intensity levels

  const GitHubActivity({
    required this.date,
    required this.count,
    required this.level,
  });

  factory GitHubActivity.fromJson(Map<String, dynamic> json) =>
      _$GitHubActivityFromJson(json);

  Map<String, dynamic> toJson() => _$GitHubActivityToJson(this);

  @override
  List<Object?> get props => [date, count, level];
}

@JsonSerializable()
class GitHubYearData extends Equatable {
  final int year;
  final List<GitHubActivity> activities;

  const GitHubYearData({
    required this.year,
    required this.activities,
  });

  factory GitHubYearData.fromJson(Map<String, dynamic> json) =>
      _$GitHubYearDataFromJson(json);

  Map<String, dynamic> toJson() => _$GitHubYearDataToJson(this);

  @override
  List<Object?> get props => [year, activities];
}
