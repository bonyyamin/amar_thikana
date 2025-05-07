import '../../domain/models/review/review.dart';
import '../../domain/models/review/rating.dart';

class ReviewDto {
  final String? id;
  final String propertyId;
  final String reviewerId;
  final String reviewerName;
  final String reviewerAvatar;
  final String comment;
  final RatingDto rating;
  final DateTime createdAt;
  final DateTime? updatedAt;

  ReviewDto({
    this.id,
    required this.propertyId,
    required this.reviewerId,
    required this.reviewerName,
    required this.reviewerAvatar,
    required this.comment,
    required this.rating,
    required this.createdAt,
    this.updatedAt,
  });

  factory ReviewDto.fromJson(Map<String, dynamic> json) {
    return ReviewDto(
      id: json['id'],
      propertyId: json['propertyId'],
      reviewerId: json['reviewerId'],
      reviewerName: json['reviewerName'],
      reviewerAvatar: json['reviewerAvatar'],
      comment: json['comment'],
      rating: RatingDto.fromJson(json['rating']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] != null 
        ? DateTime.parse(json['updatedAt']) 
        : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'propertyId': propertyId,
      'reviewerId': reviewerId,
      'reviewerName': reviewerName,
      'reviewerAvatar': reviewerAvatar,
      'comment': comment,
      'rating': rating.toJson(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  Review toDomain() {
    return Review(
      id: id ?? '',
      propertyId: propertyId,
      reviewerId: reviewerId,
      reviewerName: reviewerName,
      reviewerAvatar: reviewerAvatar,
      comment: comment,
      rating: rating.toDomain(),
      createdAt: createdAt,
      updatedAt: updatedAt, userId: '', userName: '', userImage: '',
    );
  }

  factory ReviewDto.fromDomain(Review review) {
    return ReviewDto(
      id: review.id,
      propertyId: review.propertyId,
      reviewerId: review.reviewerId,
      reviewerName: review.reviewerName,
      reviewerAvatar: review.reviewerAvatar,
      comment: review.comment,
      rating: RatingDto.fromDomain(review.rating),
      createdAt: review.createdAt,
      updatedAt: review.updatedAt,
    );
  }
}

class RatingDto {
  final double overall;
  final double location;
  final double cleanliness;
  final double accuracy;
  final double value;
  final double communication;

  RatingDto({
    required this.overall,
    required this.location,
    required this.cleanliness,
    required this.accuracy,
    required this.value,
    required this.communication,
  });

  factory RatingDto.fromJson(Map<String, dynamic> json) {
    return RatingDto(
      overall: (json['overall'] as num).toDouble(),
      location: (json['location'] as num).toDouble(),
      cleanliness: (json['cleanliness'] as num).toDouble(),
      accuracy: (json['accuracy'] as num).toDouble(),
      value: (json['value'] as num).toDouble(),
      communication: (json['communication'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'overall': overall,
      'location': location,
      'cleanliness': cleanliness,
      'accuracy': accuracy,
      'value': value,
      'communication': communication,
    };
  }

  Rating toDomain() {
    return Rating(
      overall: overall,
      location: location,
      cleanliness: cleanliness,
      accuracy: accuracy,
      value: value,
      communication: communication,
    );
  }

  factory RatingDto.fromDomain(Rating rating) {
    return RatingDto(
      overall: rating.overall,
      location: rating.location,
      cleanliness: rating.cleanliness,
      accuracy: rating.accuracy,
      value: rating.value,
      communication: rating.communication,
    );
  }
}