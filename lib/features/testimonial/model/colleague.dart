import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'colleague.g.dart';

@JsonSerializable()
class Colleague extends Equatable {
  final String name;
  final String image;
  final String role;

  const Colleague({
    required this.name,
    required this.image,
    required this.role,
  });

  factory Colleague.fromJson(Map<String, dynamic> json) =>
      _$ColleagueFromJson(json);
  Map<String, dynamic> toJson() => _$ColleagueToJson(this);

  @override
  List<Object?> get props => [name, image, role];
}
