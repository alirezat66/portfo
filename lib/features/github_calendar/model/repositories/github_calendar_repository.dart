import 'dart:convert';
import 'package:http/http.dart' as http;

import '../data/github_activity.dart';

/// Keeps the same interface you used before.
abstract class GitHubCalendarRepository {
  Future<List<GitHubYearData>> getGitHubHistory(
    String username, {
    bool debug = false,
  });
}

/// Implementation that talks to YOUR Node API.
/// Default base URL points to your domain; you can override in tests.
class GitHubCalendarRepositoryImpl implements GitHubCalendarRepository {
  final String baseUrl;
  final Duration timeout;

  GitHubCalendarRepositoryImpl({
    this.baseUrl = 'https://api.taghizadeh.dev',
    this.timeout = const Duration(seconds: 12),
  });

  @override
  Future<List<GitHubYearData>> getGitHubHistory(
    String username, {
    bool debug = false,
  }) async {
    if (username.trim().isEmpty) {
      throw ArgumentError('username is required');
    }

    final uri = Uri.parse(
      '$baseUrl/api/github/calendar/$username',
    ).replace(queryParameters: {if (debug) 'debug': '1'});

    final res = await http
        .get(uri, headers: const {'Accept': 'application/json'})
        .timeout(timeout);

    if (res.statusCode != 200) {
      throw Exception('API ${res.statusCode}: ${res.body}');
    }

    final decoded = json.decode(res.body);

    // Normalize to a List<dynamic> named yearsJson
    List<dynamic> yearsJson;
    if (decoded is List) {
      yearsJson = decoded; // success (list shape)
    } else if (decoded is Map<String, dynamic>) {
      final ok = decoded['ok'];
      final err = decoded['error'] ?? decoded['message'];
      if (ok == false || err != null) {
        // structured error from API
        throw Exception('API error: ${err ?? 'unknown'}');
      }
      if (decoded['years'] is List) {
        yearsJson = List<dynamic>.from(
          decoded['years'],
        ); // debug success (object shape)
      } else {
        throw Exception('Unexpected API response: ${res.body}');
      }
    } else {
      throw Exception('Unexpected API response type');
    }

    // Map JSON -> models
    final years = <GitHubYearData>[];
    for (final y in yearsJson) {
      if (y is! Map<String, dynamic>) continue;
      final year = y['year'] is int
          ? y['year'] as int
          : int.parse('${y['year']}');
      final activitiesJson = (y['activities'] as List?) ?? const [];
      final activities = activitiesJson.map((a) {
        final m = a as Map<String, dynamic>;
        return GitHubActivity(
          date: DateTime.parse(m['date'] as String),
          count: (m['count'] as num).toInt(),
          level: (m['level'] as num).toInt(),
        );
      }).toList();
      years.add(GitHubYearData(year: year, activities: activities));
    }

    years.sort((a, b) => b.year.compareTo(a.year));
    return years;
  }
}
