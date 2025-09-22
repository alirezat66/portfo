import '../../../../core/network/network_client.dart';
import '../../../../core/network/network_config.dart';

class MenuRemoteRepositoryImpl {
  final NetworkClient _networkClient;

  MenuRemoteRepositoryImpl({
    NetworkClient? networkClient,
  }) : _networkClient = networkClient ??
            NetworkClient(
              baseUrl: NetworkConfig.cmsBaseUrl,
              timeout: NetworkConfig.defaultTimeout,
            );

  Future<Map<String, dynamic>> getMenuData() async {
    try {
      return await _networkClient.get(NetworkConfig.menuEndpoint);
    } catch (e) {
      throw Exception('Error fetching menu data: $e');
    }
  }

  List<Map<String, dynamic>> getMenuItems(Map<String, dynamic> menuData) {
    final ctas = menuData['data']['ctas'] as List?;
    if (ctas == null) return [];

    return ctas.map((cta) {
      if (cta is Map<String, dynamic>) {
        return {
          'title': cta['title'] ?? '',
          'route': cta['content'] ?? '',
        };
      }
      return {'title': '', 'route': ''};
    }).toList();
  }

  List<Map<String, dynamic>> getSocialLinks(Map<String, dynamic> menuData) {
    final socialLinks = menuData['data']['social_links'] as List?;
    if (socialLinks == null) return [];

    return socialLinks.map((link) {
      if (link is Map<String, dynamic>) {
        return {
          'name': link['name'] ?? '',
          'url': link['url'] ?? '',
          'tooltip': link['tooltip'] ?? '',
        };
      }
      return {'name': '', 'url': '', 'tooltip': ''};
    }).toList();
  }

  String getTalkTitle(Map<String, dynamic> menuData) {
    return menuData['data']['talk_title'] ?? 'Let\'s Talk';
  }

  String getCalendarLink(Map<String, dynamic> menuData) {
    return menuData['data']['googleCalendarLink'] ?? '';
  }
}
