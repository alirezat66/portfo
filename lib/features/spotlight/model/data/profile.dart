import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:portfolio/core/models/availability_status.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile extends Equatable {
  final String name;
  final String title;
  final String description;
  final String profileImagePath;
  final String profileImageHoverPath;
  final List<SocialLink> socialLinks;
  @JsonKey(
      fromJson: _availabilityStatusFromJson, toJson: _availabilityStatusToJson)
  final AvailabilityStatus availabilityStatus;

  const Profile({
    required this.name,
    required this.title,
    required this.description,
    required this.profileImagePath,
    required this.profileImageHoverPath,
    required this.socialLinks,
    required this.availabilityStatus,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  /// Create Profile from API response data
  factory Profile.fromApiData(Map<String, dynamic> apiData) {
    final spotlightData = apiData['data'];

    return Profile(
      name: spotlightData['name'] ?? '',
      title: _formatMainDescription(spotlightData['mainDescription'] ?? ''),
      description: spotlightData['subDescription'] ?? '',
      profileImagePath: _getImageUrl(spotlightData['profileImage']),
      profileImageHoverPath: _getImageUrl(spotlightData['profileImageHover']),
      socialLinks: _convertSocialLinks(spotlightData['social_links']),
      availabilityStatus:
          _convertAvailabilityStatus(spotlightData['availibilityStatus']),
    );
  }

  Map<String, dynamic> toJson() => _$ProfileToJson(this);

  @override
  List<Object?> get props => [
        name,
        title,
        description,
        profileImagePath,
        profileImageHoverPath,
        socialLinks,
        availabilityStatus,
      ];
}

// Helper methods for API data parsing
String _formatMainDescription(String mainDescription) {
  return mainDescription.replaceAll('\\n', '\n').replaceAll('*', '•').trim();
}

String _getImageUrl(dynamic imageData) {
  if (imageData == null) return '';
  if (imageData is Map<String, dynamic>) {
    final url = imageData['url'] as String?;
    return url != null ? 'https://cms.taghizadeh.dev$url' : '';
  }
  return '';
}

AvailabilityStatus _convertAvailabilityStatus(dynamic availabilityStatus) {
  if (availabilityStatus == null) return AvailabilityStatus.available;

  final status = availabilityStatus.toString().toLowerCase();
  switch (status) {
    case 'available':
      return AvailabilityStatus.available;
    case 'partiallyavailable':
    case 'partially_available':
      return AvailabilityStatus.partiallyAvailable;
    case 'fullybusy':
    case 'fully_busy':
      return AvailabilityStatus.fullyBusy;
    default:
      return AvailabilityStatus.available;
  }
}

List<SocialLink> _convertSocialLinks(dynamic socialLinksData) {
  if (socialLinksData == null || socialLinksData is! List) {
    return [];
  }

  return (socialLinksData).map((link) {
    if (link is Map<String, dynamic>) {
      return SocialLink(
        name: link['name'] ?? '',
        url: link['url'] ?? '',
        iconPath: _getSocialIcon(link['name'] ?? ''),
        tooltip: link['tooltip'] ?? '',
      );
    }
    return SocialLink(name: '', url: '', iconPath: '', tooltip: '');
  }).toList();
}

String _getSocialIcon(String name) {
  switch (name.toLowerCase()) {
    case 'github':
      return 'assets/icons/github.svg';
    case 'linkedin':
      return 'assets/icons/linkedin.svg';
    case 'youtube':
      return 'assets/icons/youtube.svg';
    default:
      return 'assets/icons/github.svg';
  }
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

// Custom converters for AvailabilityStatus
AvailabilityStatus _availabilityStatusFromJson(String json) {
  switch (json.toLowerCase()) {
    case 'available':
      return AvailabilityStatus.available;
    case 'partiallyavailable':
    case 'partially_available':
      return AvailabilityStatus.partiallyAvailable;
    case 'fullybusy':
    case 'fully_busy':
      return AvailabilityStatus.fullyBusy;
    default:
      return AvailabilityStatus.available;
  }
}

String _availabilityStatusToJson(AvailabilityStatus status) {
  switch (status) {
    case AvailabilityStatus.available:
      return 'available';
    case AvailabilityStatus.partiallyAvailable:
      return 'partially_available';
    case AvailabilityStatus.fullyBusy:
      return 'fully_busy';
  }
}
