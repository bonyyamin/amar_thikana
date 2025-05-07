import 'package:amar_thikana/application/providers/review/review_providers.dart';
import 'package:amar_thikana/core/theme/app_colors.dart';
import 'package:amar_thikana/core/theme/app_text_styles.dart';
import 'package:amar_thikana/domain/models/property/property.dart';
import 'package:amar_thikana/domain/models/review/rating.dart';
import 'package:amar_thikana/presentation/common_widgets/buttons/primary_button.dart';
import 'package:amar_thikana/presentation/screens/renter/property_details/widgets/owner_info.dart';
import 'package:amar_thikana/presentation/screens/renter/property_details/widgets/property_details_appbar.dart';
import 'package:amar_thikana/presentation/screens/renter/property_details/widgets/property_header.dart';
import 'package:amar_thikana/presentation/screens/renter/property_details/widgets/property_reviews_section.dart';
import 'package:flutter/material.dart';
import 'package:amar_thikana/domain/models/review/review.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PropertyDetailsScreen extends ConsumerStatefulWidget {
  final Property property;

  const PropertyDetailsScreen({super.key, required this.property});

  @override
  ConsumerState<PropertyDetailsScreen> createState() =>
      _PropertyDetailsScreenState();
}

class _PropertyDetailsScreenState extends ConsumerState<PropertyDetailsScreen> {
  final PageController _pageController = PageController();

  final List<String> _demoImages = [
    'https://picsum.photos/400/300?random=1',
    'https://picsum.photos/400/300?random=2',
    'https://picsum.photos/400/300?random=3',
    'https://picsum.photos/400/300?random=4',
  ];

  Future<void> _seedReviews() async {
    final repository = ref.read(reviewRepositoryProvider);
    final reviews = [
      Review(
        id: 'demo1',
        userId: 'user1',
        propertyId: widget.property.id,
        userName: 'John Doe',
        rating: Rating(overall: 4, location: 4, cleanliness: 4, accuracy: 3, value: 4, communication: 4),
        createdAt: DateTime.now().subtract(const Duration(days: 5)),
        comment:
            'Great location and very clean property. The owner was very helpful and responsive. Would definitely recommend!',
        userImage: 'https://picsum.photos/200?random=1', reviewerId: '', reviewerName: '', reviewerAvatar: '',
      ),
      Review(
        id: 'demo2',
        userId: 'user2',
        propertyId: widget.property.id,
        userName: 'Jane Smith',
        createdAt: DateTime.now().subtract(const Duration(days: 10)),
        comment:
            'Perfect accommodation for students. Close to university and shopping areas. The facilities are well maintained.',
        userImage: 'https://picsum.photos/200?random=2', reviewerId: '', reviewerName: '', reviewerAvatar: '', rating: Rating(overall: 4, location: 5, cleanliness: 2, accuracy: 1, value: 5, communication: 2),
      ),
      Review(
        id: 'demo3',
        userId: 'user3',
        propertyId: widget.property.id,
        userName: 'Mike Johnson',
        rating: Rating(overall: 3.5, location: 34, cleanliness: 3, accuracy: 5, value: 5, communication: 6),
        createdAt: DateTime.now().subtract(const Duration(days: 15)),
        comment:
            'Good value for money. Could use some minor maintenance but overall a comfortable stay.',
        userImage: 'https://picsum.photos/200?random=3', reviewerId: '', reviewerName: '', reviewerAvatar: '',
      ),
      Review(
        id: 'demo4',
        userId: 'user4',
        propertyId: widget.property.id,
        userName: 'Sarah Wilson',
        rating: Rating(overall: 4, location: 4, cleanliness: 4, accuracy: 4, value: 4, communication: 4),
        createdAt: DateTime.now().subtract(const Duration(days: 20)),
        comment:
            'Nice neighborhood but the internet connection was a bit slow. The owner promised to upgrade it soon.',
        userImage: 'https://picsum.photos/200?random=4', reviewerId: '', reviewerName: '', reviewerAvatar: '',
      ),
      Review(
        id: 'demo5',
        userId: 'user5',
        propertyId: widget.property.id,
        userName: 'David Chen',
        rating: Rating(overall: 4, location: 4, cleanliness: 4, accuracy: 4, value: 4, communication: 4),
        createdAt: DateTime.now().subtract(const Duration(days: 25)),
        comment:
            'Exceptional cleanliness and modern amenities. The security system gives great peace of mind.',
        userImage: 'https://picsum.photos/200?random=5', reviewerId: '', reviewerName: '', reviewerAvatar: '',
      ),
    ];

    for (final review in reviews) {
      await repository.addReview(review);
    }
  }

  @override
  void initState() {
    super.initState();
    // Uncomment the following line to seed reviews (use only once)
    _seedReviews();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PropertyDetailsAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PropertyHeader(
                    property: widget.property,
                    pageController: _pageController,
                    images: _demoImages,
                  ),
                  const SizedBox(height: 24),
                  _buildDescription(),
                  const SizedBox(height: 24),
                  _buildAmenities(),
                  const SizedBox(height: 24),
                  OwnerInfo(),
                  const SizedBox(height: 24),
                  PropertyReviewsSection(propertyId: widget.property.id),
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

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description:',
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
