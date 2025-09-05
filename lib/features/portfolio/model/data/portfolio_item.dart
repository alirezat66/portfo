import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'portfolio_item.g.dart';

@JsonSerializable()
class PortfolioItem extends Equatable {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final List<String> technologies;
  final String? liveUrl;
  final String? githubUrl;
  final DateTime createdAt;

  const PortfolioItem({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.technologies,
    this.liveUrl,
    this.githubUrl,
    required this.createdAt,
  });

  factory PortfolioItem.fromJson(Map<String, dynamic> json) =>
      _$PortfolioItemFromJson(json);

  Map<String, dynamic> toJson() => _$PortfolioItemToJson(this);

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    imageUrl,
    technologies,
    liveUrl,
    githubUrl,
    createdAt,
  ];
}



