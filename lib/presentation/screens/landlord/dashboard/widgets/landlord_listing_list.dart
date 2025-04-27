import 'package:flutter/material.dart';

class LandlordListingsList extends StatelessWidget {
  const LandlordListingsList({super.key});

  @override
  Widget build(BuildContext context) {
    final listings = [
      {
        'title': 'Modern Apartment in Dhaka',
        'status': 'Active',
        'views': '45',
        'type': 'Apartment',
      },
      {
        'title': 'Student Hostel Room',
        'status': 'Under Review',
        'views': '32',
        'type': 'Hostel',
      },
      {
        'title': 'Single Room in Uttara',
        'status': 'Active',
        'views': '28',
        'type': 'Room',
      },
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listings.length,
      itemBuilder: (context, index) {
        final listing = listings[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),
            title: Text(listing['title']!),
            subtitle: Text(
              'Type: ${listing['type']} • ${listing['views']} views',
            ),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color:
                    listing['status'] == 'Active'
                        ? Colors.green.withOpacity(0.1)
                        : Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                listing['status']!,
                style: TextStyle(
                  color:
                      listing['status'] == 'Active'
                          ? Colors.green
                          : Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            onTap: () {
              // TODO: Navigate to listing details
            },
          ),
        );
      },
    );
  }
}
