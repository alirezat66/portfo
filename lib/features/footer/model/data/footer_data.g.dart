// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'footer_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FooterData _$FooterDataFromJson(Map<String, dynamic> json) => FooterData(
      copyright: Copyright.fromJson(json['copyright'] as Map<String, dynamic>),
      socialLinks: (json['socialLinks'] as List<dynamic>)
          .map((e) => SocialLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      navigationLinks: (json['navigationLinks'] as List<dynamic>)
          .map((e) => NavigationLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      contactInfo:
          ContactInfo.fromJson(json['contactInfo'] as Map<String, dynamic>),
      quickLinks: (json['quickLinks'] as List<dynamic>)
          .map((e) => QuickLink.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FooterDataToJson(FooterData instance) =>
    <String, dynamic>{
      'copyright': instance.copyright,
      'socialLinks': instance.socialLinks,
      'navigationLinks': instance.navigationLinks,
      'contactInfo': instance.contactInfo,
      'quickLinks': instance.quickLinks,
    };

Copyright _$CopyrightFromJson(Map<String, dynamic> json) => Copyright(
      text: json['text'] as String,
      year: json['year'] as String,
      company: json['company'] as String,
    );

Map<String, dynamic> _$CopyrightToJson(Copyright instance) => <String, dynamic>{
      'text': instance.text,
      'year': instance.year,
      'company': instance.company,
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

NavigationLink _$NavigationLinkFromJson(Map<String, dynamic> json) =>
    NavigationLink(
      title: json['title'] as String,
      route: json['route'] as String,
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$NavigationLinkToJson(NavigationLink instance) =>
    <String, dynamic>{
      'title': instance.title,
      'route': instance.route,
      'isActive': instance.isActive,
    };

ContactInfo _$ContactInfoFromJson(Map<String, dynamic> json) => ContactInfo(
      email: json['email'] as String,
      phone: json['phone'] as String,
      location: json['location'] as String,
    );

Map<String, dynamic> _$ContactInfoToJson(ContactInfo instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phone': instance.phone,
      'location': instance.location,
    };

QuickLink _$QuickLinkFromJson(Map<String, dynamic> json) => QuickLink(
      title: json['title'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$QuickLinkToJson(QuickLink instance) => <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
    };
