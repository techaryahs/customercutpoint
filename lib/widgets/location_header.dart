import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../screens/location/location_selection_screen.dart';

class LocationHeader extends StatelessWidget {
  const LocationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const LocationSelectionScreen(),
          ),
        );
      },
      child: Row(
        children: [
          const Icon(
            Icons.location_on_outlined,
            color: AppColors.accent,
            size: 22,
          ),
          const SizedBox(width: 6),
          Text(
            "New York",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(width: 4),
          const Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.textLight,
          ),
        ],
      ),
    );
  }
}
