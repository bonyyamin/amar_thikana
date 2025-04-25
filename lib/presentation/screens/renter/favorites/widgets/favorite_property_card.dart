import 'package:flutter/material.dart';
import 'package:amar_thikana/domain/models/property/property.dart';
import 'package:amar_thikana/core/theme/app_colors.dart';
import 'package:amar_thikana/core/theme/app_text_styles.dart';
import 'package:amar_thikana/presentation/screens/renter/property_details/property_details_screen.dart';

class FavoritePropertyCard extends StatelessWidget {
  final Property property;
  final VoidCallback? onDelete;
  final VoidCallback? onCall;

  const FavoritePropertyCard({
    Key? key,
    required this.property,
    this.onDelete,
    this.onCall,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PropertyDetailsScreen(property: property),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    property.coverImage ?? 'https://via.placeholder.com/100',
                    height: 150,
                    width: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 100,
                        width: 100,
                        color: Colors.grey[200],
                        child: const Icon(Icons.image_not_supported),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        property.title,
                        style: AppTextStyles.h4.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      if (property.description != null) ...[
                        Text(
                          property.description!,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: Colors.grey[600],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                      ],
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppColors.primaryLight,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            property.location?.city ?? 'Unknown Location',
                            style: AppTextStyles.bodySmall.copyWith(
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            '${property.rating} (${property.reviewsCount} Reviews)',
                            style: AppTextStyles.caption.copyWith(
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.king_bed_outlined,
                            color: AppColors.primaryLight,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text('${property.bedrooms}'),
                          const SizedBox(width: 16),
                          Icon(
                            Icons.bathtub_outlined,
                            color: AppColors.primaryLight,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text('${property.bathrooms}'),
                          const Spacer(),
                          Text(
                            '\৳${property.pricePerMonth?.toStringAsFixed(0) ?? '0'}/mo',
                            style: AppTextStyles.bodyLarge.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton.icon(
                  icon: const Icon(Icons.call),
                  label: const Text('Call Now'),
                  onPressed:
                      onCall ??
                      () {
                        // Default call logic (replace with real phone number logic)
                        debugPrint('Calling owner of property: ${property.id}');
                      },
                ),
                const SizedBox(width: 12),
                ElevatedButton.icon(
                  icon: const Icon(Icons.delete_outline),
                  label: const Text('Delete'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade400,
                    foregroundColor: Colors.white,
                  ),
                  onPressed:
                      onDelete ??
                      () {
                        // Default delete logic (can be overridden)
                        debugPrint(
                          'Removing property from favorites: ${property.id}',
                        );
                      },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
