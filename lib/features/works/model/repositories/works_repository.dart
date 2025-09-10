import 'dart:convert';
import 'package:flutter/services.dart';
import '../data/work_item.dart';

abstract class WorksRepository {
  Future<List<WorkItem>> getWorks();
  Future<List<WorkItem>> getSelectedWorks();
}

class WorksRepositoryImpl implements WorksRepository {
  @override
  Future<List<WorkItem>> getWorks() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/data/works.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);

      final List<dynamic> worksJson = jsonData['works'] as List<dynamic>;

      final List<WorkItem> works =
          worksJson.map((workJson) => WorkItem.fromJson(workJson)).toList();

      // Sort by order and return all works
      works.sort((a, b) => a.order.compareTo(b.order));
      return works;
    } catch (e) {
      throw Exception('Failed to load works data: $e');
    }
  }

  @override
  Future<List<WorkItem>> getSelectedWorks() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/data/works.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);

      final List<dynamic> worksJson = jsonData['works'] as List<dynamic>;

      final List<WorkItem> works =
          worksJson.map((workJson) => WorkItem.fromJson(workJson)).toList();

      // Sort by order and take only the first 4 items
      works.sort((a, b) => a.order.compareTo(b.order));
      return works.take(4).toList();
    } catch (e) {
      throw Exception('Failed to load selected works data: $e');
    }
  }
}
