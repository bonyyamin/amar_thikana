// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RatingImpl _$$RatingImplFromJson(Map<String, dynamic> json) => _$RatingImpl(
  overall: (json['overall'] as num).toDouble(),
  location: (json['location'] as num).toDouble(),
  cleanliness: (json['cleanliness'] as num).toDouble(),
  accuracy: (json['accuracy'] as num).toDouble(),
  value: (json['value'] as num).toDouble(),
  communication: (json['communication'] as num).toDouble(),
);

Map<String, dynamic> _$$RatingImplToJson(_$RatingImpl instance) =>
    <String, dynamic>{
      'overall': instance.overall,
      'location': instance.location,
      'cleanliness': instance.cleanliness,
      'accuracy': instance.accuracy,
      'value': instance.value,
      'communication': instance.communication,
    };
