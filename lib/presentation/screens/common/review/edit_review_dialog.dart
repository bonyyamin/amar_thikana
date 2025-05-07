import 'package:amar_thikana/domain/models/review/review.dart';
import 'package:flutter/material.dart';

class EditReviewDialog extends StatefulWidget {
  final String initialReview;
  final double initialRating;
  final Function(String review, double rating) onSubmit;

  const EditReviewDialog({
    super.key,
    required this.initialReview,
    required this.initialRating,
    required this.onSubmit, required Review review, required String propertyId,
  });

  @override
  _EditReviewDialogState createState() => _EditReviewDialogState();
}

class _EditReviewDialogState extends State<EditReviewDialog> {
  late TextEditingController _reviewController;
  late double _rating;

  @override
  void initState() {
    super.initState();
    _reviewController = TextEditingController(text: widget.initialReview);
    _rating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Edit Review"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _reviewController,
            decoration: const InputDecoration(labelText: "Your Review"),
            maxLines: 3,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return IconButton(
                icon: Icon(
                  index < _rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                ),
                onPressed: () {
                  setState(() {
                    _rating = index + 1.0;
                  });
                },
              );
            }),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onSubmit(_reviewController.text, _rating);
            Navigator.pop(context);
          },
          child: const Text("Save"),
        ),
      ],
    );
  }
}