import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkClient {
  final String baseUrl;
  final Duration timeout;
  final Map<String, String> defaultHeaders;

  NetworkClient({
    this.baseUrl = 'https://cms.taghizadeh.dev',
    this.timeout = const Duration(seconds: 10),
    this.defaultHeaders = const {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    },
  });

  /// GET request
  Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  }) async {
    try {
      final uri = Uri.parse('$baseUrl$endpoint').replace(
        queryParameters: queryParameters,
      );

      final response = await http.get(
        uri,
        headers: {...defaultHeaders, ...?headers},
      ).timeout(timeout);

      if (response.statusCode == 200) {
        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        throw NetworkException(
          'GET request failed: ${response.statusCode}',
          response.statusCode,
          response.body,
        );
      }
    } catch (e) {
      if (e is NetworkException) rethrow;
      throw NetworkException('Network error: $e', 0, '');
    }
  }

  /// POST request
  Future<Map<String, dynamic>> post(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    try {
      final uri = Uri.parse('$baseUrl$endpoint');

      final response = await http
          .post(
            uri,
            headers: {...defaultHeaders, ...?headers},
            body: body != null ? json.encode(body) : null,
          )
          .timeout(timeout);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        throw NetworkException(
          'POST request failed: ${response.statusCode}',
          response.statusCode,
          response.body,
        );
      }
    } catch (e) {
      if (e is NetworkException) rethrow;
      throw NetworkException('Network error: $e', 0, '');
    }
  }

  /// PUT request
  Future<Map<String, dynamic>> put(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    try {
      final uri = Uri.parse('$baseUrl$endpoint');

      final response = await http
          .put(
            uri,
            headers: {...defaultHeaders, ...?headers},
            body: body != null ? json.encode(body) : null,
          )
          .timeout(timeout);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        throw NetworkException(
          'PUT request failed: ${response.statusCode}',
          response.statusCode,
          response.body,
        );
      }
    } catch (e) {
      if (e is NetworkException) rethrow;
      throw NetworkException('Network error: $e', 0, '');
    }
  }

  /// DELETE request
  Future<Map<String, dynamic>> delete(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    try {
      final uri = Uri.parse('$baseUrl$endpoint');

      final response = await http.delete(
        uri,
        headers: {...defaultHeaders, ...?headers},
      ).timeout(timeout);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        throw NetworkException(
          'DELETE request failed: ${response.statusCode}',
          response.statusCode,
          response.body,
        );
      }
    } catch (e) {
      if (e is NetworkException) rethrow;
      throw NetworkException('Network error: $e', 0, '');
    }
  }
}

/// Custom exception for network errors
class NetworkException implements Exception {
  final String message;
  final int statusCode;
  final String responseBody;

  NetworkException(this.message, this.statusCode, this.responseBody);

  @override
  String toString() => 'NetworkException: $message (Status: $statusCode)';
}
