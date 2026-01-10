import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/profile_header_card.dart';
import '../../widgets/profile_menu_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER CARD
            const ProfileHeaderCard(),

            const SizedBox(height: 30),

            // ================= ACCOUNT =================
            _sectionTitle("ACCOUNT"),
            const SizedBox(height: 12),
            const ProfileMenuTile(
              icon: Icons.person_outline,
              title: "Personal Information",
            ),
            const SizedBox(height: 10),
            const ProfileMenuTile(
              icon: Icons.notifications_none,
              title: "Notifications",
            ),
            const SizedBox(height: 10),
            const ProfileMenuTile(
              icon: Icons.settings_outlined,
              title: "Preferences",
            ),

            const SizedBox(height: 30),

            // ================= FAVORITES =================
            _sectionTitle("FAVORITES"),
            const SizedBox(height: 12),
            const ProfileMenuTile(
              icon: Icons.favorite_border,
              title: "Saved Services",
            ),
            const SizedBox(height: 10),
            const ProfileMenuTile(
              icon: Icons.people_outline,
              title: "Preferred Stylists",
            ),

            const SizedBox(height: 30),

            // ================= MEMBERSHIP & WALLET =================
            _sectionTitle("MEMBERSHIP & WALLET"),
            const SizedBox(height: 12),
            const ProfileMenuTile(
              icon: Icons.workspace_premium,
              title: "Membership Status",
              trailing: _StatusBadge(text: "Premium"),
            ),
            const SizedBox(height: 10),
            const ProfileMenuTile(
              icon: Icons.account_balance_wallet_outlined,
              title: "Wallet & Offers",
              trailing: _StatusBadge(text: "\$50"),
            ),

            const SizedBox(height: 30),

            // ================= SUPPORT =================
            _sectionTitle("SUPPORT"),
            const SizedBox(height: 12),
            const ProfileMenuTile(
              icon: Icons.help_outline,
              title: "Help & FAQ",
            ),
            const SizedBox(height: 10),
            const ProfileMenuTile(
              icon: Icons.privacy_tip_outlined,
              title: "Privacy & Terms",
            ),

            const SizedBox(height: 30),

            // ================= LOGOUT =================
            ProfileMenuTile(
              icon: Icons.logout,
              title: "Log Out",
              isLogout: true,
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // SECTION TITLE WIDGET
  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
        color: AppColors.textLight,
      ),
    );
  }
}

// STATUS BADGE (Premium / Wallet)
class _StatusBadge extends StatelessWidget {
  final String text;

  const _StatusBadge({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFE7F8ED),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.accent,
        ),
      ),
    );
  }
}
