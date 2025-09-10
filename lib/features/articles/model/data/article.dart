import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article extends Equatable {
  final String id;
  final String title;
  final String excerpt;
  final String content;
  final String author;
  final String publishDate;
  final String readTime;
  final String category;
  final String imageUrl;
  final String slug;
  final List<String> tags;
  final bool isPublished;
  final int views;
  final int likes;
  final String source;
  const Article({
    required this.id,
    required this.title,
    required this.excerpt,
    required this.content,
    required this.author,
    required this.publishDate,
    required this.readTime,
    required this.category,
    required this.imageUrl,
    required this.slug,
    required this.tags,
    required this.isPublished,
    required this.views,
    required this.likes,
    required this.source,
  });

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);

  @override
  List<Object?> get props => [
        id,
        title,
        excerpt,
        content,
        author,
        publishDate,
        readTime,
        category,
        imageUrl,
        slug,
        tags,
        isPublished,
        views,
        likes,
      ];
}
