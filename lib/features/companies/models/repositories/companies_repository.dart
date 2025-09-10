import 'dart:convert';
import 'package:flutter/services.dart';
import '../data/company.dart';

abstract class CompaniesRepository {
  Future<List<Company>> getCompanies();
}

class CompaniesRepositoryImpl implements CompaniesRepository {
  @override
  Future<List<Company>> getCompanies() async {
    try {
      // Simulate API call delay
      await Future.delayed(const Duration(milliseconds: 100));

      // Load JSON from assets
      final String jsonString =
          await rootBundle.loadString('assets/data/companies.json');
      final List<dynamic> jsonData = json.decode(jsonString);

      // Parse JSON to Company objects
      return jsonData.map((json) => Company.fromJson(json)).toList();
    } catch (e) {
      // If JSON loading fails, throw an error
      throw Exception('Failed to load companies data: $e');
    }
  }
}
