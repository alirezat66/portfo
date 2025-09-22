import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:portfolio/features/spotlight/model/repositories/spotlight_repository.dart';
import '../data/profile.dart';
import '../../../../core/models/availability_status.dart';

class SpotlightRemoteRepositoryImpl implements SpotlightRepository {
  final String baseUrl;
  final Duration timeout;

  SpotlightRemoteRepositoryImpl({
    this.baseUrl = 'https://cms.taghizadeh.dev',
    this.timeout = const Duration(seconds: 10),
  });

  @override
  Future<Profile> getProfile() async {
    try {
      final uri = Uri.parse('$baseUrl/api/spotLight?populate=all');

      final response = await http.get(uri,
          headers: const {'Accept': 'application/json'}).timeout(timeout);

      if (response.statusCode != 200) {
        throw Exception(
            'Failed to fetch spotlight data: ${response.statusCode}');
      }

      final Map<String, dynamic> jsonData = json.decode(response.body);
      final spotlightData = jsonData['data'];

      // Convert backend data to existing Profile model
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
    } catch (e) {
      throw Exception('Error fetching spotlight data: $e');
    }
  }

  String _formatMainDescription(String mainDescription) {
    // Clean up the description formatting
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
}
