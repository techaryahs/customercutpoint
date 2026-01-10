import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class PastBookingCard extends StatelessWidget {
  final String imagePath;
  final String serviceName;
  final String staffName;
  final String date;
  final String price;
  final bool showRateButton;

  const PastBookingCard({
    super.key,
    required this.imagePath,
    required this.serviceName,
    required this.staffName,
    required this.date,
    required this.price,
    this.showRateButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(14),
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
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
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
                Text(
                  serviceName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 2),

                Text(
                  "with $staffName",
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.textLight,
                  ),
                ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    const Icon(Icons.calendar_today,
                        size: 14, color: AppColors.textLight),
                    const SizedBox(width: 4),
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.textLight,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (showRateButton)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF4E0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "Rate Service",
                          style: TextStyle(
                            color: Color(0xFFC9A24D),
                            fontWeight: FontWeight.w600,
                          ),
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
