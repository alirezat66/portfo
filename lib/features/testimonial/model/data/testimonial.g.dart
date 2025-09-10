// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'testimonial.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Testimonial _$TestimonialFromJson(Map<String, dynamic> json) => Testimonial(
      colleague: Colleague.fromJson(json['colleague'] as Map<String, dynamic>),
      quote: json['quote'] as String,
      shortQuote: json['shortQuote'] as String,
      company: json['company'] as String,
      source: json['source'] as String,
    );

Map<String, dynamic> _$TestimonialToJson(Testimonial instance) =>
    <String, dynamic>{
      'colleague': instance.colleague,
      'quote': instance.quote,
      'shortQuote': instance.shortQuote,
      'company': instance.company,
      'source': instance.source,
    };
