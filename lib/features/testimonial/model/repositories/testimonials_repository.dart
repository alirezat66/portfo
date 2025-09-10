import 'dart:convert';
import 'package:flutter/services.dart';
import '../data/testimonial.dart';

abstract class TestimonialsRepository {
  Future<List<Testimonial>> getTestimonials();
}

class TestimonialsRepositoryImpl implements TestimonialsRepository {
  @override
  Future<List<Testimonial>> getTestimonials() async {
    try {
      await Future.delayed(const Duration(milliseconds: 100));
      final String jsonString =
          await rootBundle.loadString('assets/data/testimonials.json');
      final List<dynamic> jsonData = json.decode(jsonString);
      return jsonData
          .map((e) => Testimonial.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Failed to load testimonials data: $e');
    }
  }
}
