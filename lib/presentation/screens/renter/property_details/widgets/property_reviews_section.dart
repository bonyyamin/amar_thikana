import 'package:amar_thikana/application/providers/review_providers.dart';
import 'package:flutter/material.dart';
import 'package:amar_thikana/core/theme/app_colors.dart';
import 'package:amar_thikana/core/theme/app_text_styles.dart';
import 'package:amar_thikana/domain/models/review/review.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class PropertyReviewsSection extends ConsumerWidget {
  final String propertyId;

  const PropertyReviewsSection({super.key, required this.propertyId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviewsAsync = ref.watch(propertyReviewsProvider(propertyId));

    return reviewsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Text('Error loading reviews: $error'),
      data:
          (reviews) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Reviews (${reviews.length})',
                    style: AppTextStyles.h5.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (reviews.isNotEmpty) ...[
                    Text(
                      'Avg ${_calculateAverageRating(reviews)}',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 16),
              if (reviews.isEmpty)
                Text(
                  'No reviews yet',
                  style: AppTextStyles.bodyMedium.copyWith(color: Colors.grey),
                )
              else
                ...reviews.map(
                  (review) => Column(
                    children: [
                      _buildReviewItem(review),
                      if (review != reviews.last) const Divider(height: 24),
                    ],
                  ),
                ),
            ],
          ),
    );
  }

  double _calculateAverageRating(List<Review> reviews) {
    if (reviews.isEmpty) return 0;
    final total = reviews.fold(0.0, (sum, review) => sum + review.rating);
    return double.parse((total / reviews.length).toStringAsFixed(1));
  }

  Widget _buildReviewItem(Review review) {
    final formattedDate = DateFormat('yyyy-MM-dd').format(review.createdAt);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage:
              review.userImage != null
                  ? NetworkImage(review.userImage!)
                  : const AssetImage('assets/images/profile.jpg')
                      as ImageProvider,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    review.userName,
                    style: AppTextStyles.bodyLarge.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    formattedDate,
                    style: AppTextStyles.bodySmall.copyWith(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.star, color: AppColors.primary, size: 18),
                  const SizedBox(width: 4),
                  Text(
                    review.rating.toString(),
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(review.comment, style: AppTextStyles.bodyMedium),
            ],
          ),
        ),
      ],
    );
  }
}
