import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class ProfileMenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final bool isLogout;

  const ProfileMenuTile({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color iconBg =
    isLogout ? Colors.red.withOpacity(0.1) : AppColors.background;

    final Color iconColor =
    isLogout ? Colors.red : AppColors.textDark;

    final Color textColor =
    isLogout ? Colors.red : AppColors.textDark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          // Icon
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: iconBg,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor),
          ),

          const SizedBox(width: 14),

          // Title
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
          ),

          // Trailing
          if (!isLogout)
            trailing ??
                const Icon(
                  Icons.chevron_right,
                  color: AppColors.textLight,
                ),
        ],
      ),
    );
  }
}
