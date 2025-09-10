// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkItem _$WorkItemFromJson(Map<String, dynamic> json) => WorkItem(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      imagePath: json['imagePath'] as String,
      technologies: (json['technologies'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      liveUrl: json['liveUrl'] as String?,
      githubUrl: json['githubUrl'] as String?,
      category: json['category'] as String,
      order: (json['order'] as num).toInt(),
    );

Map<String, dynamic> _$WorkItemToJson(WorkItem instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'imagePath': instance.imagePath,
      'technologies': instance.technologies,
      'liveUrl': instance.liveUrl,
      'githubUrl': instance.githubUrl,
      'category': instance.category,
      'order': instance.order,
    };
