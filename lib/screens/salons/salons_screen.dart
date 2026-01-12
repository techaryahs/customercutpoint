import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/salon_list_card.dart';
import '../location/location_selection_screen.dart';

class SalonsScreen extends StatefulWidget {
  const SalonsScreen({super.key});

  @override
  State<SalonsScreen> createState() => _SalonsScreenState();
}

class _SalonsScreenState extends State<SalonsScreen> {
  String selectedSort = "Recommended";
  String selectedLocation = "New York";

  final List<String> sortOptions = [
    "Recommended",
    "Nearest",
    "Rating",
    "Price: Low to High",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 LOCATION ROW
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: AppColors.accent,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        selectedLocation,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  // ✅ CHANGE BUTTON
                  GestureDetector(
                    onTap: () async {
                      final selectedCity =
                      await Navigator.push<String>(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                          const LocationSelectionScreen(),
                        ),
                      );

                      if (selectedCity != null) {
                        setState(() {
                          selectedLocation = selectedCity;
                        });
                      }
                    },
                    child: Text(
                      "Change",
                      style: TextStyle(
                        color: AppColors.accent,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // 🔹 PAGE TITLE
              Text(
                "Nearby Salons",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDark,
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 FILTERS ROW
              Row(
                children: [
                  // Filters button
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.tune, size: 18),
                        SizedBox(width: 6),
                        Text("Filters"),
                      ],
                    ),
                  ),

                  const SizedBox(width: 12),

                  // Sort dropdown
                  Expanded(
                    child: PopupMenuButton<String>(
                      color: const Color(0xFFF9F5F0),
                      elevation: 8,
                      offset: const Offset(0, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      onSelected: (value) {
                        setState(() {
                          selectedSort = value;
                        });
                      },
                      itemBuilder: (context) {
                        return sortOptions.map((option) {
                          return PopupMenuItem<String>(
                            value: option,
                            child: Text(
                              option,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: option == selectedSort
                                    ? FontWeight.w600
                                    : FontWeight.normal,
                                color: option == selectedSort
                                    ? AppColors.accent
                                    : AppColors.textDark,
                              ),
                            ),
                          );
                        }).toList();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(selectedSort),
                            const Icon(Icons.keyboard_arrow_down),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // 🔹 SALON LIST
              const SalonListCard(
                name: "Serenity Spa & Wellness",
                imagePath: "assets/Serenity_spa.jpg",
                rating: 4.9,
                reviews: "324",
                priceRange: "\$\$",
                distance: "0.8 km",
                services: ["Spa", "Massage", "Facial"],
                offerText: "20% off on first visit",
              ),

              const SalonListCard(
                name: "Glamour Hair Studio",
                imagePath: "assets/Glamour_studio.jpg",
                rating: 4.7,
                reviews: "189",
                priceRange: "\$\$",
                distance: "1.2 km",
                services: ["Hair", "Nails"],
                offerText: "15% off",
              ),

              const SalonListCard(
                name: "Elite Men's Grooming",
                imagePath: "assets/elite_mens.jpg",
                rating: 4.8,
                reviews: "210",
                priceRange: "\$\$",
                distance: "0.5 km",
                services: ["Hair", "Beard"],
                offerText: "10% off",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
