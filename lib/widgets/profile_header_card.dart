import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class ProfileHeaderCard extends StatelessWidget {
  const ProfileHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
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
          // Top row
          Row(
            children: [
              // Avatar
              Container(
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                  color: const Color(0xFFA7C4B5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    "JD",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 14),

              // Name & email
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Jane Doe",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "jane.doe@email.com",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textLight,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF4E0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        "👑 Premium Member",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFC9A24D),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),
          const Divider(),

          const SizedBox(height: 16),

          // Stats row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _StatItem(title: "Visits", value: "12"),
              _StatItem(title: "Wallet", value: "\$50"),
              _StatItem(title: "Offers", value: "3"),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String title;
  final String value;

  const _StatItem({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            fontSize: 13,
            color: AppColors.textLight,
          ),
        ),
      ],
    );
  }
}
