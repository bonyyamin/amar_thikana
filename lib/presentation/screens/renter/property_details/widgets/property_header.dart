import 'package:flutter/material.dart';
import 'package:amar_thikana/core/theme/app_colors.dart';
import 'package:amar_thikana/core/theme/app_text_styles.dart';
import 'package:amar_thikana/domain/models/property/property.dart';
import 'package:dots_indicator/dots_indicator.dart';

class PropertyHeader extends StatefulWidget {
  final Property property;
  final PageController pageController;
  final List<String> images;

  const PropertyHeader({
    super.key,
    required this.property,
    required this.pageController,
    required this.images,
  });

  @override
  State<PropertyHeader> createState() => _PropertyHeaderState();
}

class _PropertyHeaderState extends State<PropertyHeader> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: PageView.builder(
                  controller: widget.pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: widget.images.length,
                  itemBuilder: (context, index) {
                    return Image.network(
                      widget.images[index],
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 12,
                left: 0,
                right: 0,
                child: Center(
                  child: DotsIndicator(
                    dotsCount: widget.images.length,
                    position: _currentPage,
                    decorator: DotsDecorator(
                      color: Colors.grey[400]!,
                      activeColor: AppColors.primary,
                      size: const Size(8, 8),
                      activeSize: const Size(8, 8),
                      spacing: const EdgeInsets.all(4),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          widget.property.title,
          style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8),
        Row(
          children: [
            const Icon(Icons.location_on, size: 16, color: AppColors.primary),
            const SizedBox(width: 4),
            Text(
              '${widget.property.location?.city}, ${widget.property.location?.state}',
              style: AppTextStyles.bodyMedium.copyWith(color: Colors.grey[600]),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.star, color: Colors.amber, size: 20),
            const SizedBox(width: 4),
            Text(
              '${widget.property.rating} (${widget.property.reviewsCount})',
              style: AppTextStyles.bodyMedium,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          '৳${widget.property.pricePerMonth}/mo',
          style: AppTextStyles.h3.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
