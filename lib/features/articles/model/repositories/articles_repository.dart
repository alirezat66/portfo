import 'dart:convert';
import 'package:flutter/services.dart';
import '../data/article.dart';

abstract class ArticlesRepository {
  Future<List<Article>> getArticles();
  Future<List<Article>> getLatestArticles({int limit = 3});
  Future<Article?> getArticleById(String id);
  Future<List<Article>> getArticlesByCategory(String category);
  Future<List<Article>> searchArticles(String query);
}

class ArticlesRepositoryImpl implements ArticlesRepository {
  @override
  Future<List<Article>> getArticles() async {
    try {
      await Future.delayed(const Duration(milliseconds: 100));
      final String jsonString =
          await rootBundle.loadString('assets/data/articles.json');
      final List<dynamic> jsonData = json.decode(jsonString);
      return jsonData
          .map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Failed to load articles data: $e');
    }
  }

  @override
  Future<List<Article>> getLatestArticles({int limit = 3}) async {
    final articles = await getArticles();
    return articles.where((article) => article.isPublished).toList()
      ..sort((a, b) => b.publishDate.compareTo(a.publishDate))
      ..take(limit);
  }

  @override
  Future<Article?> getArticleById(String id) async {
    final articles = await getArticles();
    try {
      return articles.firstWhere((article) => article.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<Article>> getArticlesByCategory(String category) async {
    final articles = await getArticles();
    return articles
        .where((article) =>
            article.isPublished &&
            article.category.toLowerCase() == category.toLowerCase())
        .toList()
      ..sort((a, b) => b.publishDate.compareTo(a.publishDate));
  }

  @override
  Future<List<Article>> searchArticles(String query) async {
    final articles = await getArticles();
    final lowercaseQuery = query.toLowerCase();
    return articles
        .where((article) =>
            article.isPublished &&
            (article.title.toLowerCase().contains(lowercaseQuery) ||
                article.excerpt.toLowerCase().contains(lowercaseQuery) ||
                article.tags
                    .any((tag) => tag.toLowerCase().contains(lowercaseQuery))))
        .toList()
      ..sort((a, b) => b.publishDate.compareTo(a.publishDate));
  }
}
