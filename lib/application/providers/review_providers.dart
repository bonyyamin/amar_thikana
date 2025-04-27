import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:amar_thikana/domain/models/review/review.dart';

final propertyReviewsProvider = StreamProvider.family<List<Review>, String>((
  ref,
  propertyId,
) {
  return FirebaseFirestore.instance
      .collection('reviews')
      .where('propertyId', isEqualTo: propertyId)
      .orderBy('createdAt', descending: true)
      .snapshots()
      .map(
        (snapshot) =>
            snapshot.docs.map((doc) => Review.fromFirestore(doc)).toList(),
      );
});

final reviewRepositoryProvider = Provider((ref) => ReviewRepository());

class ReviewRepository {
  final _db = FirebaseFirestore.instance;

  Future<void> addReview(Review review) async {
    await _db.collection('reviews').add({
      'userId': review.userId,
      'propertyId': review.propertyId,
      'userName': review.userName,
      'rating': review.rating,
      'createdAt': review.createdAt,
      'comment': review.comment,
      'userImage': review.userImage,
    });
  }
}
