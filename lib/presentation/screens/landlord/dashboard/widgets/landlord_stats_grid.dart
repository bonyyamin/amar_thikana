import 'package:flutter/material.dart';

class LandlordStatsGrid extends StatelessWidget {
  const LandlordStatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = [
      {'title': 'Active Listings', 'value': '5', 'icon': Icons.home},
      {'title': 'Total Views', 'value': '127', 'icon': Icons.visibility},
      {'title': 'Unread Messages', 'value': '3', 'icon': Icons.message},
      {'title': 'Interested Renters', 'value': '12', 'icon': Icons.people},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      itemCount: stats.length,
      itemBuilder: (context, index) {
        final stat = stats[index];
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(stat['icon'] as IconData, color: Theme.of(context).colorScheme.primary),
                const SizedBox(height: 8),
                Text(
                  stat['value'] as String,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  stat['title'] as String,
                  style: const TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
