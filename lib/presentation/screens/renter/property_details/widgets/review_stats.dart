import 'package:flutter/material.dart';

class ReviewStats extends StatelessWidget {
  final Map<String, double> stats;
  
  const ReviewStats({
    super.key,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.star,
                color: theme.colorScheme.primary,
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                '${stats['overall']?.toStringAsFixed(1) ?? '0.0'} overall',
                style: theme.textTheme.titleLarge,
              ),
              const Spacer(),
              Text(
                '${stats['count']?.toInt() ?? 0} reviews',
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildRatingBar(
                  context,
                  'Location',
                  stats['location'] ?? 0,
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: _buildRatingBar(
                  context,
                  'Cleanliness',
                  stats['cleanliness'] ?? 0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildRatingBar(
                  context,
                  'Accuracy',
                  stats['accuracy'] ?? 0,
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: _buildRatingBar(
                  context,
                  'Value',
                  stats['value'] ?? 0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildRatingBar(
                  context,
                  'Communication',
                  stats['communication'] ?? 0,
                ),
              ),
              const SizedBox(width: 24),
              const Expanded(child: SizedBox()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRatingBar(BuildContext context, String label, double rating) {
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Expanded(
              flex: 7,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: LinearProgressIndicator(
                  value: rating / 5,
                  backgroundColor: theme.colorScheme.surfaceContainerHighest,
                  color: theme.colorScheme.primary,
                  minHeight: 6,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              rating.toStringAsFixed(1),
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}