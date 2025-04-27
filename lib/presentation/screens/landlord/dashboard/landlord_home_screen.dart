import 'package:amar_thikana/presentation/screens/landlord/dashboard/widgets/landlord_listing_list.dart';
import 'package:flutter/material.dart';
import 'package:amar_thikana/core/theme/app_colors.dart';
import 'package:amar_thikana/presentation/screens/landlord/dashboard/widgets/landlord_header.dart';
import 'package:amar_thikana/presentation/screens/landlord/dashboard/widgets/landlord_stats_grid.dart';

class LandlordHomeScreen extends StatelessWidget {
  const LandlordHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LandlordHeader(),
              const SizedBox(height: 20),
              Text(
                "Welcome Back, Landlord!",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const LandlordStatsGrid(),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  // Navigate to Add New Listing
                },
                icon: const Icon(Icons.add),
                label: const Text("Add New Listing"),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: AppColors.secondary,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Your Active Listings",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const LandlordListingsList(),
            ],
          ),
        ),
      ),
    );
  }
}
