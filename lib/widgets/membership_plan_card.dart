import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class MembershipPlanCard extends StatelessWidget {
  final String title;
  final String price;
  final List<String> benefits;
  final bool isPopular;

  const MembershipPlanCard({
    super.key,
    required this.title,
    required this.price,
    required this.benefits,
    this.isPopular = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: isPopular
            ? Border.all(color: const Color(0xFFC9A24D), width: 2)
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          if (isPopular)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: const BoxDecoration(
                color: Color(0xFFC9A24D),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(26),
                ),
              ),
              child: const Center(
                child: Text(
                  "Most Popular",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title + Arrow
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Icon(Icons.chevron_right),
                  ],
                ),

                const SizedBox(height: 8),

                // Price
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: price,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: " /month",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textLight,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Benefits
                ...benefits.map(
                      (benefit) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        const Icon(Icons.check,
                            size: 18, color: AppColors.accent),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            benefit,
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.textLight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // CTA Button
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Center(
                    child: Text(
                      "Choose Plan",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
