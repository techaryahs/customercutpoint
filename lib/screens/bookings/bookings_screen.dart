import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/booking_card.dart';
import '../../widgets/past_booking_card.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  int selectedTab = 0; // 0 = Upcoming, 1 = Past

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              "My Bookings",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: AppColors.textDark,
              ),
            ),

            const SizedBox(height: 20),

            // Segmented Tabs
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.25),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  _buildTab("Upcoming", 0),
                  _buildTab("Past", 1),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // CONTENT BASED ON TAB
            if (selectedTab == 0) ...[
              const BookingCard(
                imagePath: "assets/Massage1.jpg",
                status: "✔ Confirmed",
                statusBg: Color(0xFFE7F8ED),
                statusText: AppColors.accent,
                serviceName: "Swedish Massage",
                staffName: "Emma Wilson",
                date: "Jan 15, 2026",
                time: "2:00 PM",
                price: "\$89",
              ),

              const BookingCard(
                imagePath: "assets/Massage1.jpg",
                status: "⏳ Pending",
                statusBg: Color(0xFFFFF3CD),
                statusText: Color(0xFFB58B00),
                serviceName: "Hydrating Facial",
                staffName: "Sarah Chen",
                date: "Jan 22, 2026",
                time: "10:30 AM",
                price: "\$75",
              ),

              const BookingCard(
                imagePath: "assets/Massage1.jpg",
                status: "⏳ Pending",
                statusBg: Color(0xFFFFF3CD),
                statusText: Color(0xFFB58B00),
                serviceName: "Hydrating Facial",
                staffName: "Sarah Chen",
                date: "Jan 22, 2026",
                time: "10:30 AM",
                price: "\$75",
              ),

              const BookingCard(
                imagePath: "assets/Massage1.jpg",
                status: "⏳ Pending",
                statusBg: Color(0xFFFFF3CD),
                statusText: Color(0xFFB58B00),
                serviceName: "Hydrating Facial",
                staffName: "Sarah Chen",
                date: "Jan 22, 2026",
                time: "10:30 AM",
                price: "\$75",
              ),
            ] else ...[
              const PastBookingCard(
                imagePath: "assets/Nail.jpg",
                serviceName: "Gel Manicure",
                staffName: "Lisa Park",
                date: "Dec 28, 2025",
                price: "\$45",
              ),

              const PastBookingCard(
                imagePath: "assets/masge.jpg",
                serviceName: "Deep Tissue Massage",
                staffName: "Emma Wilson",
                date: "Dec 15, 2025",
                price: "\$110",
                showRateButton: true,
              ),

              const PastBookingCard(
                imagePath: "assets/Nail.jpg",
                serviceName: "Gel Manicure",
                staffName: "Lisa Park",
                date: "Dec 28, 2025",
                price: "\$45",
              ),

              const PastBookingCard(
                imagePath: "assets/masge.jpg",
                serviceName: "Deep Tissue Massage",
                staffName: "Emma Wilson",
                date: "Dec 15, 2025",
                price: "\$110",
                showRateButton: true,
              ),

            ],
          ],
        ),
      ),
    );
  }

  // TAB BUTTON
  Widget _buildTab(String title, int index) {
    final bool isSelected = selectedTab == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedTab = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? AppColors.textDark
                    : AppColors.textLight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
