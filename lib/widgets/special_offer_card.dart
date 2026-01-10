import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: LinearGradient(
          colors: [
            AppColors.accent.withOpacity(0.15),
            AppColors.primary.withOpacity(0.25),
          ],
        ),
      ),
      child: Row(
        children: [
          // Icon
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.card_giftcard,
                color: AppColors.accent),
          ),

          const SizedBox(width: 14),

          // Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "First Visit Special",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Get 25% off on your first booking",
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.textLight,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "FIRST25",
                    style: TextStyle(
                      fontSize: 12,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Text(
            "Apply",
            style: TextStyle(
              color: AppColors.accent,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
