// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RatingImpl _$$RatingImplFromJson(Map<String, dynamic> json) => _$RatingImpl(
  id: json['id'] as String,
  userId: json['userId'] as String,
  itemId: json['itemId'] as String,
  rating: (json['rating'] as num).toDouble(),
  type: json['type'] as String? ?? 'property',
  createdAt: DateTime.parse(json['createdAt'] as String),
  comment: json['comment'] as String?,
);

Map<String, dynamic> _$$RatingImplToJson(_$RatingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'itemId': instance.itemId,
      'rating': instance.rating,
      'type': instance.type,
      'createdAt': instance.createdAt.toIso8601String(),
      'comment': instance.comment,
    };
