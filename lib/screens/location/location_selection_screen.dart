import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../navigation/bottom_nav_screen.dart';

class LocationSelectionScreen extends StatelessWidget {
  const LocationSelectionScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                // Icon
                Container(
                  height: 64,
                  width: 64,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.location_on,
                    size: 30,
                    color: AppColors.accent,
                  ),
                ),

                const SizedBox(height: 24),

                // Title
                const Text(
                  "Find Salons Near You",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  "Select your city to discover premium spas and salons",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textLight,
                  ),
                ),

                const SizedBox(height: 28),

                // Detect location button (UI only)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Text(
                      "📍 Detect My Location",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Search city
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.search, color: AppColors.textLight),
                      SizedBox(width: 10),
                      Text(
                        "Search for a city...",
                        style: TextStyle(color: AppColors.textLight),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // Popular Cities
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "POPULAR CITIES",
                    style: TextStyle(
                      fontSize: 12,
                      letterSpacing: 1,
                      color: AppColors.textLight,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                _cityTile(
                  context,
                  city: "New York",
                  salons: "245 salons available",
                ),
                _cityTile(
                  context,
                  city: "Los Angeles",
                  salons: "189 salons available",
                ),
                _cityTile(
                  context,
                  city: "Chicago",
                  salons: "134 salons available",
                ),
                _cityTile(
                  context,
                  city: "Miami",
                  salons: "156 salons available",
                ),
                _cityTile(
                  context,
                  city: "San Francisco",
                  salons: "134 salons available",
                ),
                _cityTile(
                  context,
                  city: "Seattle",
                  salons: "87 salons available",
                ),
                _cityTile(
                  context,
                  city: "Boston",
                  salons: "64 salons available",
                ),
                _cityTile(
                  context,
                  city: "France",
                  salons: "74 salons available",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // CITY TILE
  Widget _cityTile(
      BuildContext context, {
        required String city,
        required String salons,
      }) {
    return GestureDetector(
      onTap: () {
        // Navigate to HOME (Bottom Nav)
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (_) => const BottomNavScreen(),
          ),
              (route) => false,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.location_on,
                  color: AppColors.accent, size: 18),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    city,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    salons,
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.textLight,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right,
                color: AppColors.textLight),
          ],
        ),
      ),
    );
  }
}
