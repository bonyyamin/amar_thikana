import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../screens/controllers/form_controllers/review_form_controller.dart';
import 'rating_input.dart';

class AddReviewDialog extends ConsumerStatefulWidget {
  final String propertyId;

  const AddReviewDialog({super.key, required this.propertyId});

  @override
  ConsumerState<AddReviewDialog> createState() => _AddReviewDialogState();
}

class _AddReviewDialogState extends ConsumerState<AddReviewDialog> {
  late TextEditingController _reviewController;
  late double _rating;

  @override
  void initState() {
    super.initState();
    _reviewController = TextEditingController();
    _rating = 3.0; // Default rating
  }

  void _submitReview(dynamic reviewProvider) {
    final reviewText = _reviewController.text.trim();
    if (reviewText.isNotEmpty) {
      ref
          .read(reviewProvider.notifier)
          .addReview(widget.propertyId, reviewText, _rating);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add Review"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _reviewController,
            decoration: const InputDecoration(
              labelText: "Write your review",
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 10),
          RatingInput(
            initialRating: _rating,
            onRatingChanged: (newRating) {
              setState(() {
                _rating = newRating;
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () => _submitReview(ref.read(reviewFormControllerProvider)),
          child: const Text("Submit"),
        ),
      ],
    );
  }
}
