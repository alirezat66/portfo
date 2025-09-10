import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'footer_data.g.dart';

@JsonSerializable()
class FooterData extends Equatable {
  final Copyright copyright;
  final List<SocialLink> socialLinks;
  final List<NavigationLink> navigationLinks;
  final ContactInfo contactInfo;
  final List<QuickLink> quickLinks;

  const FooterData({
    required this.copyright,
    required this.socialLinks,
    required this.navigationLinks,
    required this.contactInfo,
    required this.quickLinks,
  });

  factory FooterData.fromJson(Map<String, dynamic> json) =>
      _$FooterDataFromJson(json);

  Map<String, dynamic> toJson() => _$FooterDataToJson(this);

  @override
  List<Object?> get props => [
        copyright,
        socialLinks,
        navigationLinks,
        contactInfo,
        quickLinks,
      ];
}

@JsonSerializable()
class Copyright extends Equatable {
  final String text;
  final String year;
  final String company;

  const Copyright({
    required this.text,
    required this.year,
    required this.company,
  });

  factory Copyright.fromJson(Map<String, dynamic> json) =>
      _$CopyrightFromJson(json);

  Map<String, dynamic> toJson() => _$CopyrightToJson(this);

  @override
  List<Object?> get props => [text, year, company];
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
class NavigationLink extends Equatable {
  final String title;
  final String route;
  final bool isActive;

  const NavigationLink({
    required this.title,
    required this.route,
    required this.isActive,
  });

  factory NavigationLink.fromJson(Map<String, dynamic> json) =>
      _$NavigationLinkFromJson(json);

  Map<String, dynamic> toJson() => _$NavigationLinkToJson(this);

  @override
  List<Object?> get props => [title, route, isActive];
}

@JsonSerializable()
class ContactInfo extends Equatable {
  final String email;
  final String phone;
  final String location;

  const ContactInfo({
    required this.email,
    required this.phone,
    required this.location,
  });

  factory ContactInfo.fromJson(Map<String, dynamic> json) =>
      _$ContactInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ContactInfoToJson(this);

  @override
  List<Object?> get props => [email, phone, location];
}

@JsonSerializable()
class QuickLink extends Equatable {
  final String title;
  final String url;

  const QuickLink({
    required this.title,
    required this.url,
  });

  factory QuickLink.fromJson(Map<String, dynamic> json) =>
      _$QuickLinkFromJson(json);

  Map<String, dynamic> toJson() => _$QuickLinkToJson(this);

  @override
  List<Object?> get props => [title, url];
}
