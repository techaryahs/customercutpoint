import 'package:flutter/material.dart';
import '../../widgets/membership_plan_card.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/offer_card.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                "Offers & Membership",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDark,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                "Exclusive deals just for you",
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textLight,
                ),
              ),

              const SizedBox(height: 24),

              // Active Offers
              Text(
                "Active Offers",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDark,
                ),
              ),

              const SizedBox(height: 16),

              const OfferCard(
                icon: Icons.card_giftcard,
                discount: "25% OFF",
                title: "First Visit Special",
                description: "Get 25% off on your first spa treatment",
                code: "WELCOME25",
                expiry: "Jan 31, 2026",
                bgColor: Color(0xFFE9F4EF),
              ),

              const OfferCard(
                icon: Icons.auto_awesome,
                discount: "\$50 OFF",
                title: "Couples Retreat Package",
                description: "Book any couples massage and save \$50",
                code: "COUPLES50",
                expiry: "Feb 14, 2026",
                bgColor: Color(0xFFFFF4E0),
              ),

              const OfferCard(
                icon: Icons.workspace_premium,
                discount: "15% OFF",
                title: "Premium Member Deal",
                description: "Exclusive discount for premium members",
                code: "PREMIUM15",
                expiry: "Mar 31, 2026",
                bgColor: Color(0xFFF3ECE6),
              ),

              const SizedBox(height: 32),

              // Membership Section Title
              Row(
                children: const [
                  Icon(Icons.workspace_premium, color: Color(0xFFC9A24D)),
                  SizedBox(width: 6),
                  Text(
                    "Membership Plans",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              const MembershipPlanCard(
                title: "Serenity Basic",
                price: "\$49",
                benefits: [
                  "10% off all services",
                  "Priority booking",
                  "Birthday special treatment",
                  "Members-only offers",
                ],
              ),

              const SizedBox(height: 16),

              const MembershipPlanCard(
                title: "Serenity Premium",
                price: "\$99",
                isPopular: true,
                benefits: [
                  "20% off all services",
                  "1 free massage per month",
                  "Priority + same-day booking",
                  "Complimentary upgrades",
                  "+ 2 more benefits",
                ],
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
