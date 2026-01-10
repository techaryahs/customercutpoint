import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 54,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: AppColors.secondary,
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: AppColors.textLight),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              "Search salons or services...",
              style: TextStyle(
                fontSize: 15,
                color: AppColors.textLight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
