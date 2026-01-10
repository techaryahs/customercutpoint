import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/location_header.dart';
import '../../widgets/home_search_bar.dart';
import '../../widgets/category_card.dart';
import '../../widgets/top_rated_salon_card.dart';
import '../../widgets/special_offer_card.dart';
import '../../widgets/nearby_salon_card.dart';
import '../salons/salons_screen.dart';
import '../offers/offers_screen.dart';
import '../salons/salon_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Navigate to Salons
  void _goToSalons(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const SalonsScreen()),
    );
  }

  // Navigate to Offers
  void _goToOffers(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const OffersScreen()),
    );
  }

  // Navigate to Salon Detail
  void _goToSalonDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const SalonDetailsScreen(
          name: "Serenity Spa & Wellness",
          imagePath: "assets/Serenity_spa.jpg",
          rating: 4.9,
          reviews: "324",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Location
            const LocationHeader(),
            const SizedBox(height: 24),

            // Title
            Text(
              "Find Your Perfect",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: AppColors.textDark,
              ),
            ),
            Text(
              "Spa & Salon",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppColors.accent,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Discover and book from 500+ premium salons near you",
              style: TextStyle(
                fontSize: 15,
                color: AppColors.textLight,
              ),
            ),

            const SizedBox(height: 24),

            // Search
            const HomeSearchBar(),

            const SizedBox(height: 30),

            // Browse by Category
            Text(
              "Browse by Category",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 16),

            GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 14,
              crossAxisSpacing: 14,
              childAspectRatio: 0.75,
              children: [
                _category(context, "Hair", Icons.content_cut, const Color(0xFFFDE4EC)),
                _category(context, "Skin", Icons.spa_outlined, const Color(0xFFFFF1D6)),
                _category(context, "Spa", Icons.eco_outlined, const Color(0xFFE7F8ED)),
                _category(context, "Massage", Icons.self_improvement, const Color(0xFFE7F0FF)),
                _category(context, "Nails", Icons.brush_outlined, const Color(0xFFEDE7F6)),
                _category(context, "Bridal", Icons.favorite_outline, const Color(0xFFFFEBEE)),
                _category(context, "Men's", Icons.male_outlined, const Color(0xFFE3F2FD)),
                _category(context, "Makeup", Icons.face_retouching_natural, const Color(0xFFFFF3E0)),
              ],
            ),

            const SizedBox(height: 32),

            // Top Rated Salons
            _sectionHeader(
              title: "Top Rated Salons",
              subtitle: "Highly recommended by customers",
              actionText: "See All",
              onTap: () => _goToSalons(context),
            ),

            const SizedBox(height: 16),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  TopRatedSalonCard(
                    name: "Serenity Spa",
                    imageUrl: "assets/Serenity_spa.jpg",
                    rating: 4.9,
                    reviews: "324",
                    distance: "0.8 km",
                    offer: "20% off",
                    onTap: () => _goToSalonDetail(context),
                  ),
                  TopRatedSalonCard(
                    name: "Glamour Studio",
                    imageUrl: "assets/Glamour_studio.jpg",
                    rating: 4.8,
                    reviews: "189",
                    distance: "1.2 km",
                    offer: "15% off",
                    onTap: () => _goToSalonDetail(context),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Special Offers
            _sectionHeader(
              title: "Special Offers",
              subtitle: "Limited time deals",
              actionText: "All Offers",
              onTap: () => _goToOffers(context),
            ),

            const SizedBox(height: 16),
            const SpecialOfferCard(),

            const SizedBox(height: 32),

            // Nearby Salons
            _sectionHeader(
              title: "Nearby Salons",
              subtitle: "Within 2 km from you",
              actionText: "View All",
              onTap: () => _goToSalons(context),
            ),

            const SizedBox(height: 16),

            const NearbySalonCard(
              name: "Elite Men's Grooming",
              imagePath: "assets/elite_mens.jpg",
              rating: 4.9,
              reviews: "198",
              services: ["Hair", "Beard"],
              distance: "0.5 km",
            ),
            const NearbySalonCard(
              name: "Serenity Spa & Wellness",
              imagePath: "assets/Serenity_spa.jpg",
              rating: 4.9,
              reviews: "324",
              services: ["Spa", "Massage"],
              distance: "0.8 km",
            ),
            const NearbySalonCard(
              name: "Glamour Hair Studio",
              imagePath: "assets/Glamour_studio.jpg",
              rating: 4.7,
              reviews: "189",
              services: ["Hair", "Nails"],
              distance: "1.2 km",
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Category helper
  Widget _category(BuildContext context, String title, IconData icon, Color color) {
    return CategoryCard(
      title: title,
      icon: icon,
      bgColor: color,
      onTap: () => _goToSalons(context),
    );
  }

  // Section header
  Widget _sectionHeader({
    required String title,
    required String subtitle,
    required String actionText,
    required VoidCallback onTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 13,
                color: AppColors.textLight,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              Text(
                actionText,
                style: TextStyle(
                  color: AppColors.accent,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.chevron_right,
                  size: 20, color: AppColors.accent),
            ],
          ),
        ),
      ],
    );
  }
}
