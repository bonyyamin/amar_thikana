// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
  id: json['id'] as String,
  userId: json['userId'] as String,
  propertyId: json['propertyId'] as String,
  userName: json['userName'] as String,
  rating: (json['rating'] as num).toDouble(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  comment: json['comment'] as String,
  userImage: json['userImage'] as String?,
);

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'propertyId': instance.propertyId,
      'userName': instance.userName,
      'rating': instance.rating,
      'createdAt': instance.createdAt.toIso8601String(),
      'comment': instance.comment,
      'userImage': instance.userImage,
    };
