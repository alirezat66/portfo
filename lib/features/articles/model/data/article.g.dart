// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      id: json['id'] as String,
      title: json['title'] as String,
      excerpt: json['excerpt'] as String,
      content: json['content'] as String,
      author: json['author'] as String,
      publishDate: json['publishDate'] as String,
      readTime: json['readTime'] as String,
      category: json['category'] as String,
      imageUrl: json['imageUrl'] as String,
      slug: json['slug'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      isPublished: json['isPublished'] as bool,
      views: (json['views'] as num).toInt(),
      likes: (json['likes'] as num).toInt(),
      source: json['source'] as String,
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'excerpt': instance.excerpt,
      'content': instance.content,
      'author': instance.author,
      'publishDate': instance.publishDate,
      'readTime': instance.readTime,
      'category': instance.category,
      'imageUrl': instance.imageUrl,
      'slug': instance.slug,
      'tags': instance.tags,
      'isPublished': instance.isPublished,
      'views': instance.views,
      'likes': instance.likes,
      'source': instance.source,
    };
