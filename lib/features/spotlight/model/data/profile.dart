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
