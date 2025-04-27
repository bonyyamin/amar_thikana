import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/application/providers/property/property_provider.dart';
import 'package:amar_thikana/core/theme/app_colors.dart';

class PropertyManagementPanel extends ConsumerWidget {
  const PropertyManagementPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final propertiesAsync = ref.watch(propertyListProvider);

    return propertiesAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
      data:
          (properties) => Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Property Management',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                _buildQuickActions(context),
                const SizedBox(height: 16),
                _buildPropertyStats(properties.length),
              ],
            ),
          ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildActionButton(
          icon: Icons.add_home,
          label: 'Add Property',
          onTap: () {
            // Navigate to add property screen
          },
        ),
        _buildActionButton(
          icon: Icons.edit,
          label: 'Edit Listings',
          onTap: () {
            // Navigate to listings screen
          },
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: AppColors.primary),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }

  Widget _buildPropertyStats(int totalProperties) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Total Properties: $totalProperties'),
        TextButton(
          onPressed: () {
            // Navigate to detailed stats
          },
          child: const Text('View Details'),
        ),
      ],
    );
  }
}
