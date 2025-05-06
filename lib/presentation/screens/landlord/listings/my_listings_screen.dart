import 'package:amar_thikana/core/theme/app_colors.dart';
import 'package:amar_thikana/presentation/screens/navigation/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/application/providers/property/property_provider.dart';
import 'package:go_router/go_router.dart';

class MyListingsScreen extends ConsumerWidget {
  const MyListingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final propertiesAsync = ref.watch(propertyListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Listings'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // TODO: Implement more filtering options
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(RouteNames.addProperty),
        backgroundColor: AppColors.primary,
        label: const Text('Add New'),
        icon: const Icon(Icons.add),
      ),
      body: propertiesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data:
            (properties) =>
                properties.isEmpty
                    ? const Center(child: Text('No properties listed yet'))
                    : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: properties.length,
                      itemBuilder: (context, index) {
                        final property = properties[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 16),
                          child: ListTile(
                            leading: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    property.coverImage ??
                                        'https://picsum.photos/200',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            title: Text(property.title),
                            subtitle: Text(
                              '৳${property.pricePerMonth}/month',
                              style: TextStyle(color: AppColors.primary),
                            ),
                            trailing: PopupMenuButton(
                              itemBuilder:
                                  (context) => [
                                    const PopupMenuItem(
                                      value: 'edit',
                                      child: Text('Edit'),
                                    ),
                                    const PopupMenuItem(
                                      value: 'delete',
                                      child: Text('Delete'),
                                    ),
                                  ],
                              onSelected: (value) async {
                                switch (value) {
                                  case 'edit':
                                    context.push(
                                      '${RouteNames.editProperty}/${property.id}',
                                    );
                                    break;
                                  case 'delete':
                                    final confirmed = await showDialog<bool>(
                                      context: context,
                                      builder:
                                          (context) => AlertDialog(
                                            title: const Text('Delete Listing'),
                                            content: const Text(
                                              'Are you sure you want to delete this listing?',
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed:
                                                    () => Navigator.pop(
                                                      context,
                                                      false,
                                                    ),
                                                child: const Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed:
                                                    () => Navigator.pop(
                                                      context,
                                                      true,
                                                    ),
                                                child: const Text('Delete'),
                                              ),
                                            ],
                                          ),
                                    );

                                    if (confirmed == true && context.mounted) {
                                      ref
                                          .read(propertyListProvider.notifier)
                                          .deleteProperty(property.id);
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text('Property deleted'),
                                        ),
                                      );
                                    }
                                }
                              },
                            ),
                          ),
                        );
                      },
                    ),
      ),
    );
  }
}
