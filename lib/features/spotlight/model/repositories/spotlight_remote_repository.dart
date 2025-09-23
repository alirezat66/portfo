import 'package:portfolio/features/spotlight/model/repositories/spotlight_repository.dart';
import '../data/profile.dart';
import '../../../../core/network/network_client.dart';
import '../../../../core/network/network_config.dart';

class SpotlightRemoteRepositoryImpl implements SpotlightRepository {
  final NetworkClient _networkClient;

  SpotlightRemoteRepositoryImpl({
    NetworkClient? networkClient,
  }) : _networkClient = networkClient ??
            NetworkClient(
              baseUrl: NetworkConfig.cmsBaseUrl,
              timeout: NetworkConfig.defaultTimeout,
            );

  @override
  Future<Profile> getProfile() async {
    try {
      final jsonData =
          await _networkClient.get(NetworkConfig.spotlightEndpoint);

      // Use the Profile.fromApiData factory method
      return Profile.fromApiData(jsonData);
    } catch (e) {
      throw Exception('Error fetching spotlight data: $e');
    }
  }
}
