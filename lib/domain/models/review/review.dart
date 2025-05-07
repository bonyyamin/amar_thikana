import 'package:freezed_annotation/freezed_annotation.dart';
import 'rating.dart';

part 'review.freezed.dart';
part 'review.g.dart';

@freezed
class Review with _$Review {
  const factory Review({
    required String id,
    required String propertyId,
    required String reviewerId,
    required String reviewerName,
    required String reviewerAvatar,
    required String comment,
    required Rating rating,
    required DateTime createdAt,
    DateTime? updatedAt, required String userId, required String userName, required String userImage,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}