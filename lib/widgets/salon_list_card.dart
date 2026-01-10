import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class SalonListCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final double rating;
  final String reviews;
  final String priceRange;
  final String distance;
  final List<String> services;
  final String offerText;
  final bool isOpen;

  const SalonListCard({
    super.key,
    required this.name,
    required this.imagePath,
    required this.rating,
    required this.reviews,
    required this.priceRange,
    required this.distance,
    required this.services,
    required this.offerText,
    this.isOpen = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
                child: Image.asset(
                  imagePath,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              // Offer badge
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFC9A24D),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    offerText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              // Wishlist
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.favorite_border, size: 20),
                ),
              ),

              // Open Now
              if (isOpen)
                Positioned(
                  bottom: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.accent.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "Open Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name + Distance
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined,
                            size: 14, color: AppColors.textLight),
                        const SizedBox(width: 4),
                        Text(
                          distance,
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.textLight,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Rating Row
                Row(
                  children: [
                    const Icon(Icons.star,
                        size: 14, color: Colors.amber),
                    const SizedBox(width: 4),
                    Text(
                      rating.toString(),
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
                    const SizedBox(width: 6),
                    const Text("•"),
                    const SizedBox(width: 6),
                    Text(
                      priceRange,
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.textLight,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Services
                Wrap(
                  spacing: 8,
                  children: services
                      .map(
                        (service) => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        service,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
