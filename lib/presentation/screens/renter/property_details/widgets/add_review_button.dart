import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/review/add_review_dialog.dart';

class AddReviewButton extends ConsumerWidget {
  final String propertyId;
  
  const AddReviewButton({
    Key? key,
    required this.propertyId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton.icon(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AddReviewDialog(propertyId: propertyId),
        );
      },
      icon: const Icon(Icons.rate_review),
      label: const Text('Write a Review'),
    );
  }
}