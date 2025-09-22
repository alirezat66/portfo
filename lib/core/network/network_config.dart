class NetworkConfig {
  // Base URLs
  static const String cmsBaseUrl = 'https://cms.taghizadeh.dev';
  static const String apiBaseUrl = 'https://api.taghizadeh.dev';

  // Timeouts
  static const Duration defaultTimeout = Duration(seconds: 10);
  static const Duration longTimeout = Duration(seconds: 30);

  // Endpoints
  static const String spotlightEndpoint = '/api/spotLight?populate=all';
  static const String menuEndpoint = '/api/menu?populate=*';
  static const String githubCalendarEndpoint = '/api/github/calendar';

  // Headers
  static const Map<String, String> defaultHeaders = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };
}
