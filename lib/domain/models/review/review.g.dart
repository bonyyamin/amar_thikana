// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
  id: json['id'] as String,
  propertyId: json['propertyId'] as String,
  reviewerId: json['reviewerId'] as String,
  reviewerName: json['reviewerName'] as String,
  reviewerAvatar: json['reviewerAvatar'] as String,
  comment: json['comment'] as String,
  rating: Rating.fromJson(json['rating'] as Map<String, dynamic>),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt:
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
  userId: json['userId'] as String,
  userName: json['userName'] as String,
  userImage: json['userImage'] as String,
);

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'propertyId': instance.propertyId,
      'reviewerId': instance.reviewerId,
      'reviewerName': instance.reviewerName,
      'reviewerAvatar': instance.reviewerAvatar,
      'comment': instance.comment,
      'rating': instance.rating.toJson(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'userId': instance.userId,
      'userName': instance.userName,
      'userImage': instance.userImage,
    };
