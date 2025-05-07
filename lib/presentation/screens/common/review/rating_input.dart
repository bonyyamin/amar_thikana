import 'package:flutter/material.dart';

class RatingInput extends StatefulWidget {
  final double initialRating;
  final Function(double) onRatingChanged;
  final int maxStars;

  const RatingInput({
    super.key,
    required this.initialRating,
    required this.onRatingChanged,
    this.maxStars = 5,
  });

  @override
  _RatingInputState createState() => _RatingInputState();
}

class _RatingInputState extends State<RatingInput> {
  late double _rating;

  @override
  void initState() {
    super.initState();
    _rating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.maxStars, (index) {
        final isFilled = index < _rating;
        return IconButton(
          icon: Icon(
            isFilled ? Icons.star : Icons.star_border,
            color: Colors.amber,
            size: 30,
          ),
          onPressed: () {
            setState(() {
              _rating = index + 1.0;
            });
            widget.onRatingChanged(_rating);
          },
        );
      }),
    );
  }
}