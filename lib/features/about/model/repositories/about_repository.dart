import 'dart:convert';
import 'package:flutter/services.dart';
import '../data/about_data.dart';

abstract class AboutRepository {
  Future<AboutData> getAboutData();
  Future<Profile> getProfile();
  Future<Statistics> getStatistics();
  Future<List<WorkExperience>> getWorkExperience();
  Future<List<SocialLink>> getSocialLinks();
  Future<List<SkillCategory>> getSkillCategories();
}

class AboutRepositoryImpl implements AboutRepository {
  @override
  Future<AboutData> getAboutData() async {
    try {
      // Simulate API call delay
      await Future.delayed(const Duration(milliseconds: 100));

      // Load JSON from assets
      final String jsonString =
          await rootBundle.loadString('assets/data/about.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);

      // Parse JSON to AboutData object
      return AboutData.fromJson(jsonData);
    } catch (e) {
      // If JSON loading fails, throw an error
      throw Exception('Failed to load about data: $e');
    }
  }

  @override
  Future<Profile> getProfile() async {
    final aboutData = await getAboutData();
    return aboutData.profile;
  }

  @override
  Future<Statistics> getStatistics() async {
    final aboutData = await getAboutData();
    return aboutData.statistics;
  }

  @override
  Future<List<WorkExperience>> getWorkExperience() async {
    final aboutData = await getAboutData();
    return aboutData.workExperience;
  }

  @override
  Future<List<SocialLink>> getSocialLinks() async {
    final aboutData = await getAboutData();
    return aboutData.socialLinks;
  }

  @override
  Future<List<SkillCategory>> getSkillCategories() async {
    final aboutData = await getAboutData();
    return aboutData.skillCategories;
  }
}
