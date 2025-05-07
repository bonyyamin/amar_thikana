import 'package:amar_thikana/application/providers/review/review_prodiver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../../../domain/models/review/review.dart';
import '../../../../common_widgets/other/rating_stars.dart';
import '../../../common/review/edit_review_dialog.dart';

class ReviewItem extends ConsumerWidget {
  final Review review;
  final bool isOwner;
  
  const ReviewItem({
    Key? key,
    required this.review,
    required this.isOwner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: review.reviewerAvatar.isNotEmpty
                    ? NetworkImage(review.reviewerAvatar)
                    : null,
                child: review.reviewerAvatar.isEmpty
                    ? Text(review.reviewerName[0])
                    : null,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.reviewerName,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    'Posted ${timeago.format(review.createdAt)}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              const Spacer(),
              if (isOwner)
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, size: 18),
                      onPressed: () {
                        ref.read(reviewNotifierProvider.notifier).setCurrentReview(review);
                        showDialog(
                          context: context,
                          builder: (context) => EditReviewDialog(
                            review: review,
                            propertyId: review.propertyId, initialReview: '', initialRating: 4, onSubmit: (String review, double rating) {  },
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, size: 18, color: Colors.red),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Delete Review'),
                            content: const Text('Are you sure you want to delete this review?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  ref.read(reviewNotifierProvider.notifier).deleteReview(
                                    review.id,
                                    review.propertyId,
                                  );
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Delete', style: TextStyle(color: Colors.red)),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              RatingStars(rating: review.rating.overall),
              const SizedBox(width: 8),
              Text(
                review.rating.overall.toStringAsFixed(1),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            review.comment,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          if (review.updatedAt != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                '(Edited ${timeago.format(review.updatedAt!)})',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
        ],
      ),
    );
  }
}