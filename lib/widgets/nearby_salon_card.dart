import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class NearbySalonCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final double rating;
  final String reviews;
  final List<String> services;
  final String distance;
  final bool isOpen;

  const NearbySalonCard({
    super.key,
    required this.name,
    required this.imagePath,
    required this.rating,
    required this.reviews,
    required this.services,
    required this.distance,
    this.isOpen = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              imagePath,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 12),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name + Open badge
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: isOpen
                            ? const Color(0xFFE7F8ED)
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        isOpen ? "Open" : "Closed",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: isOpen
                              ? AppColors.accent
                              : AppColors.textLight,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                // Rating
                Row(
                  children: [
                    const Icon(Icons.star,
                        size: 14, color: Colors.amber),
                    const SizedBox(width: 4),
                    Text(
                      "$rating",
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "($reviews)",
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.textLight,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Services
                Wrap(
                  spacing: 6,
                  children: services
                      .map(
                        (service) => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        service,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  )
                      .toList(),
                ),

                const SizedBox(height: 8),

                // Distance
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined,
                        size: 14, color: AppColors.textLight),
                    const SizedBox(width: 4),
                    Text(
                      distance,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textLight,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
