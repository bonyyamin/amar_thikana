import 'package:amar_thikana/core/theme/app_colors.dart';
import 'package:amar_thikana/core/theme/app_text_styles.dart';
import 'package:amar_thikana/domain/models/property/property.dart';
import 'package:amar_thikana/presentation/common_widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart'; // Add this package to pubspec.yaml

class PropertyDetailsScreen extends StatefulWidget {
  final Property property;

  const PropertyDetailsScreen({super.key, required this.property});

  @override
  State<PropertyDetailsScreen> createState() => _PropertyDetailsScreenState();
}

class _PropertyDetailsScreenState extends State<PropertyDetailsScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> _demoImages = [
    'https://picsum.photos/400/300?random=1',
    'https://picsum.photos/400/300?random=2',
    'https://picsum.photos/400/300?random=3',
    'https://picsum.photos/400/300?random=4',
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 24),
                  _buildDescription(),
                  const SizedBox(height: 24),
                  _buildAmenities(),
                  const SizedBox(height: 24),
                  _buildOwnerInfo(),
                  const SizedBox(height: 100), // Space for bottom button
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: _buildBottomSheet(),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: Colors.white,
      elevation: 1,
      title: Text(
        'Property Details',
        style: AppTextStyles.h5.copyWith(color: Colors.black),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.favorite_border, color: Colors.black),
          onPressed: () {
            // TODO: Implement favorite functionality
          },
        ),
        IconButton(
          icon: const Icon(Icons.share, color: Colors.black),
          onPressed: () {
            // TODO: Implement share functionality
          },
        ),
      ],
    );
  }

  Widget _buildHeader() {
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
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: _demoImages.length,
                  itemBuilder: (context, index) {
                    return Image.network(_demoImages[index], fit: BoxFit.cover);
                  },
                ),
              ),
              Positioned(
                bottom: 12,
                left: 0,
                right: 0,
                child: Center(
                  child: DotsIndicator(
                    dotsCount: _demoImages.length,
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
          style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.bold),
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

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: AppTextStyles.h5.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          widget.property.description ?? 'No description available',
          style: AppTextStyles.bodyMedium.copyWith(color: Colors.grey[600]),
        ),
      ],
    );
  }

  Widget _buildAmenities() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Property Details',
          style: AppTextStyles.h5.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildAmenityItem(
              Icons.king_bed_outlined,
              '${widget.property.bedrooms} Beds',
            ),
            _buildAmenityItem(
              Icons.bathtub_outlined,
              '${widget.property.bathrooms} Baths',
            ),
            _buildAmenityItem(
              Icons.car_repair_outlined,
              '${widget.property.parkingSpaces} Parking',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAmenityItem(IconData icon, String text) {
    return Column(
      children: [
        Icon(icon, color: AppColors.primary),
        const SizedBox(height: 8),
        Text(text, style: AppTextStyles.bodyMedium),
      ],
    );
  }

  Widget _buildOwnerInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.grey[200],
            child: const Icon(Icons.person, size: 32, color: Colors.grey),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('John Smith Doe', style: AppTextStyles.h5),
                Text(
                  'Property Owner',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.message_outlined, color: AppColors.primary),
            onPressed: () {
              // TODO: Implement message functionality
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSheet() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: PrimaryButton(
              text: 'Book Now',
              onPressed: () {
                // TODO: Implement booking functionality
              },
            ),
          ),
        ],
      ),
    );
  }
}
