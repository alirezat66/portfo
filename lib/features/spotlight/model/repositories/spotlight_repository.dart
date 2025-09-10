import 'dart:convert';
import 'package:flutter/services.dart';
import '../data/profile.dart';

abstract class SpotlightRepository {
  Future<Profile> getProfile();
}

class SpotlightRepositoryImpl implements SpotlightRepository {
  @override
  Future<Profile> getProfile() async {
    try {
      // Simulate API call delay
      await Future.delayed(const Duration(milliseconds: 100));

      // Load JSON from assets
      final String jsonString =
          await rootBundle.loadString('assets/data/profile.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);

      // Parse JSON to Profile object
      return Profile.fromJson(jsonData);
    } catch (e) {
      // If JSON loading fails, throw an error
      throw Exception('Failed to load profile data: $e');
    }
  }
}
