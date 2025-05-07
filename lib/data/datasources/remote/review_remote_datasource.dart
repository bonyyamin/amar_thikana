import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/errors/app_exceptions.dart';
import '../../dtos/review_dto.dart';
import '../../../core/network/api_client.dart';

abstract class ReviewRemoteDataSource {
  Future<List<ReviewDto>> getPropertyReviews(String propertyId);
  Future<Map<String, double>> getPropertyReviewStats(String propertyId);
  Future<ReviewDto> addReview(ReviewDto reviewDto);
  Future<ReviewDto> updateReview(ReviewDto reviewDto);
  Future<bool> deleteReview(String reviewId);
  Future<List<ReviewDto>> getUserReviews(String userId);
}

class ReviewRemoteDataSourceImpl implements ReviewRemoteDataSource {
  final ApiClient apiClient;
  final FirebaseFirestore firestore;

  ReviewRemoteDataSourceImpl({
    required this.apiClient,
    required this.firestore,
  });

  @override
  Future<List<ReviewDto>> getPropertyReviews(String propertyId) async {
    try {
      final snapshot = await firestore
          .collection('reviews')
          .where('propertyId', isEqualTo: propertyId)
          .orderBy('createdAt', descending: true)
          .get();

      return snapshot.docs
          .map((doc) => ReviewDto.fromJson({...doc.data(), 'id': doc.id}))
          .toList();
    } catch (e) {
      throw ServerException(message: 'Failed to fetch property reviews: $e');
    }
  }

  @override
  Future<Map<String, double>> getPropertyReviewStats(String propertyId) async {
    try {
      final snapshot = await firestore
          .collection('reviews')
          .where('propertyId', isEqualTo: propertyId)
          .get();

      if (snapshot.docs.isEmpty) {
        return {
          'overall': 0.0,
          'location': 0.0,
          'cleanliness': 0.0,
          'accuracy': 0.0,
          'value': 0.0,
          'communication': 0.0,
          'count': 0.0,
        };
      }

      double overallSum = 0;
      double locationSum = 0;
      double cleanlinessSum = 0;
      double accuracySum = 0;
      double valueSum = 0;
      double communicationSum = 0;

      for (var doc in snapshot.docs) {
        final rating = (doc.data()['rating'] as Map<String, dynamic>);
        overallSum += (rating['overall'] as num).toDouble();
        locationSum += (rating['location'] as num).toDouble();
        cleanlinessSum += (rating['cleanliness'] as num).toDouble();
        accuracySum += (rating['accuracy'] as num).toDouble();
        valueSum += (rating['value'] as num).toDouble();
        communicationSum += (rating['communication'] as num).toDouble();
      }

      final count = snapshot.docs.length;
      
      return {
        'overall': overallSum / count,
        'location': locationSum / count,
        'cleanliness': cleanlinessSum / count,
        'accuracy': accuracySum / count,
        'value': valueSum / count,
        'communication': communicationSum / count,
        'count': count.toDouble(),
      };
    } catch (e) {
      throw ServerException(message: 'Failed to fetch review stats: $e');
    }
  }

  @override
  Future<ReviewDto> addReview(ReviewDto reviewDto) async {
    try {
      // Check if user already reviewed this property
      final existingReviews = await firestore
          .collection('reviews')
          .where('propertyId', isEqualTo: reviewDto.propertyId)
          .where('reviewerId', isEqualTo: reviewDto.reviewerId)
          .get();

      if (existingReviews.docs.isNotEmpty) {
        throw ServerException(
            message: 'You have already reviewed this property');
      }

      final docRef = await firestore.collection('reviews').add(reviewDto.toJson());
      final newDoc = await docRef.get();
      
      return ReviewDto.fromJson({...newDoc.data()!, 'id': docRef.id});
    } catch (e) {
      if (e is ServerException) {
        throw e;
      }
      throw ServerException(message: 'Failed to add review: $e');
    }
  }

  @override
  Future<ReviewDto> updateReview(ReviewDto reviewDto) async {
    try {
      if (reviewDto.id == null) {
        throw ServerException(message: 'Review ID cannot be null for update');
      }
      
      await firestore
          .collection('reviews')
          .doc(reviewDto.id)
          .update({
            ...reviewDto.toJson(),
            'updatedAt': DateTime.now().toIso8601String(),
          });
      
      final updatedDoc = await firestore.collection('reviews').doc(reviewDto.id).get();
      
      return ReviewDto.fromJson({...updatedDoc.data()!, 'id': updatedDoc.id});
    } catch (e) {
      throw ServerException(message: 'Failed to update review: $e');
    }
  }

  @override
  Future<bool> deleteReview(String reviewId) async {
    try {
      await firestore.collection('reviews').doc(reviewId).delete();
      return true;
    } catch (e) {
      throw ServerException(message: 'Failed to delete review: $e');
    }
  }

  @override
  Future<List<ReviewDto>> getUserReviews(String userId) async {
    try {
      final snapshot = await firestore
          .collection('reviews')
          .where('reviewerId', isEqualTo: userId)
          .orderBy('createdAt', descending: true)
          .get();

      return snapshot.docs
          .map((doc) => ReviewDto.fromJson({...doc.data(), 'id': doc.id}))
          .toList();
    } catch (e) {
      throw ServerException(message: 'Failed to fetch user reviews: $e');
    }
  }
}