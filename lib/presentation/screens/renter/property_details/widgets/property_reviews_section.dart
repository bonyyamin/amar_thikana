import 'package:amar_thikana/application/providers/auth/auth_providers.dart';
import 'package:amar_thikana/application/providers/review/review_prodiver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../common_widgets/loaders/circular_loader.dart';
import '../../../../common_widgets/other/empty_state.dart';
import 'review_item.dart';
import 'review_stats.dart';
import 'add_review_button.dart';

class PropertyReviewsSection extends ConsumerStatefulWidget {
  final String propertyId;
  
  const PropertyReviewsSection({
    super.key,
    required this.propertyId,
  });

  @override
  ConsumerState<PropertyReviewsSection> createState() => _PropertyReviewsSectionState();
}

class _PropertyReviewsSectionState extends ConsumerState<PropertyReviewsSection> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(reviewNotifierProvider.notifier).getPropertyReviews(widget.propertyId);
      ref.read(reviewNotifierProvider.notifier).getPropertyReviewStats(widget.propertyId);
      ref.read(selectedPropertyForReviewProvider.notifier).state = widget.propertyId;
    });
  }

  @override
  Widget build(BuildContext context) {
    final reviewState = ref.watch(reviewNotifierProvider);
    final currentUser = ref.watch(currentUserProvider);

    if (reviewState.isLoading) {
      return const CircularLoader();
    }

    if (reviewState.errorMessage != null) {
      return Center(
        child: Text('Error: ${reviewState.errorMessage}'),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Reviews (${reviewState.reviews.length})',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              if (currentUser != null)
                FutureBuilder<bool>(
                  future: ref.read(canUserReviewProvider({
                    'propertyId': widget.propertyId,
                    'userId': currentUser.id,
                  }).future),
                  builder: (context, snapshot) {
                    if (snapshot.data == true) {
                      return AddReviewButton(propertyId: widget.propertyId);
                    }
                    return const SizedBox.shrink();
                  },
                ),
            ],
          ),
        ),
        // Review statistics
        if (reviewState.stats.isNotEmpty) 
          ReviewStats(stats: reviewState.stats),
          
        const SizedBox(height: 16),
        
        // Reviews list
        if (reviewState.reviews.isEmpty)
          const EmptyState(
            message: 'No reviews yet',
            icon: Icons.rate_review_outlined,
          )
        else
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: reviewState.reviews.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final review = reviewState.reviews[index];
              final isOwner = currentUser?.id == review.reviewerId;
              
              return ReviewItem(
                review: review,
                isOwner: isOwner,
              );
            },
          ),
      ],
    );
  }
}