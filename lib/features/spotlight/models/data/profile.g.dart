// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      name: json['name'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      profileImagePath: json['profileImagePath'] as String,
      profileImageHoverPath: json['profileImageHoverPath'] as String,
      socialLinks: (json['socialLinks'] as List<dynamic>)
          .map((e) => SocialLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      availabilityStatus:
          _availabilityStatusFromJson(json['availabilityStatus'] as String),
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'description': instance.description,
      'profileImagePath': instance.profileImagePath,
      'profileImageHoverPath': instance.profileImageHoverPath,
      'socialLinks': instance.socialLinks,
      'availabilityStatus':
          _availabilityStatusToJson(instance.availabilityStatus),
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
