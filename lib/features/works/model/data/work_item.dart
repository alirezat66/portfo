import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'work_item.g.dart';

@JsonSerializable()
class WorkItem extends Equatable {
  final String id;
  final String title;
  final String description;
  final String imagePath;
  final List<String> technologies;
  final String? liveUrl;
  final String? githubUrl;
  final String category;
  final int order;

  const WorkItem({
    required this.id,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.technologies,
    this.liveUrl,
    this.githubUrl,
    required this.category,
    required this.order,
  });

  factory WorkItem.fromJson(Map<String, dynamic> json) =>
      _$WorkItemFromJson(json);

  Map<String, dynamic> toJson() => _$WorkItemToJson(this);

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        imagePath,
        technologies,
        liveUrl,
        githubUrl,
        category,
        order,
      ];
}
