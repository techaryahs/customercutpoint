import 'package:flutter/material.dart';
import '../screens/home/home_screen.dart';
import '../screens/salons/salons_screen.dart';
import '../screens/bookings/bookings_screen.dart';
import '../screens/offers/offers_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../core/theme/app_colors.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    SalonsScreen(),
    BookingsScreen(),
    OffersScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.navSelected,
        unselectedItemColor: AppColors.navUnselected,
        showUnselectedLabels: true,
        elevation: 10,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront_outlined),
            label: "Salons",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: "Bookings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard_outlined),
            label: "Offers",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
