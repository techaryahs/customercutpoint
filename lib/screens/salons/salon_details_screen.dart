import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class SalonDetailsScreen extends StatefulWidget {
  final String name;
  final String imagePath;
  final double rating;
  final String reviews;

  const SalonDetailsScreen({
    super.key,
    required this.name,
    required this.imagePath,
    required this.rating,
    required this.reviews,
  });

  @override
  State<SalonDetailsScreen> createState() => _SalonDetailsScreenState();
}

class _SalonDetailsScreenState extends State<SalonDetailsScreen> {
  int selectedService = 0;

  final List<String> services = ["Spa", "Massage", "Facial"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // 🔹 MAIN CONTENT
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _imageHeader(context),
                    _detailsSection(),
                  ],
                ),
              ),
            ),

            // 🔹 BOTTOM BUTTON
            _bottomButton(),
          ],
        ),
      ),
    );
  }

  // ================= IMAGE HEADER =================
  Widget _imageHeader(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          widget.imagePath,
          height: 300,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 16,
          left: 16,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ],
    );
  }

  // ================= DETAILS =================
  Widget _detailsSection() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _titleAndRating(),
          const SizedBox(height: 6),
          Text(
            "Your sanctuary for relaxation",
            style: TextStyle(color: AppColors.textLight),
          ),

          const SizedBox(height: 20),
          _infoChips(),

          const SizedBox(height: 30),
          _aboutSection(),

          const SizedBox(height: 30),
          _servicesSection(),

          const SizedBox(height: 30),
          _serviceList(),

          const SizedBox(height: 40),
          _teamSection(),

          const SizedBox(height: 30),
          _reviewsSection(),
        ],
      ),
    );
  }

  // ================= TITLE + RATING =================
  Widget _titleAndRating() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            widget.name,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Column(
          children: [
            Row(
              children: [
                const Icon(Icons.star, size: 18, color: Colors.amber),
                const SizedBox(width: 4),
                Text(
                  widget.rating.toString(),
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Text(
              "(${widget.reviews} reviews)",
              style: TextStyle(fontSize: 12, color: AppColors.textLight),
            ),
          ],
        ),
      ],
    );
  }

  // ================= INFO CHIPS =================
  Widget _infoChips() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        _infoChip(Icons.location_on_outlined, "0.8 km"),
        _infoChip(Icons.access_time, "9:00 AM - 9:00 PM"),
        _infoChip(Icons.call, "Call"),
      ],
    );
  }

  Widget _infoChip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF3EEE8),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: AppColors.accent),
          const SizedBox(width: 6),
          Text(text),
        ],
      ),
    );
  }

  // ================= ABOUT =================
  Widget _aboutSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "About",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Text(
          "Experience ultimate relaxation at ${widget.name}. "
              "Our expert therapists offer premium treatments designed "
              "to rejuvenate your body and mind.",
          style: TextStyle(
            fontSize: 14,
            color: AppColors.textLight,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  // ================= SERVICES =================
  Widget _servicesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Services",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 44,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: services.length,
            itemBuilder: (context, index) {
              final selected = selectedService == index;
              return GestureDetector(
                onTap: () => setState(() => selectedService = index),
                child: Container(
                  margin: const EdgeInsets.only(right: 12),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  decoration: BoxDecoration(
                    color:
                    selected ? const Color(0xFF8EB69B) : Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    services[index],
                    style: TextStyle(
                      color:
                      selected ? Colors.white : AppColors.textDark,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // ================= SERVICE LIST =================
  Widget _serviceList() {
    return Column(
      children: [
        _serviceTile("Swedish Massage", "60 min", "4.9", "\$89"),
        _serviceTile("Deep Tissue Massage", "75 min", "4.8", "\$110"),
        _serviceTile("Aromatherapy", "75 min", "5.0", "\$110"),
      ],
    );
  }

  Widget _serviceTile(
      String title, String duration, String rating, String price) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(duration,
                        style: TextStyle(color: AppColors.textLight)),
                    const SizedBox(width: 10),
                    const Icon(Icons.star,
                        size: 14, color: Colors.amber),
                    const SizedBox(width: 4),
                    Text(rating),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(price,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              Text(
                "Book",
                style: TextStyle(
                  color: AppColors.accent,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ================= TEAM =================
  Widget _teamSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader("Our Team", "View All"),
        const SizedBox(height: 16),
        SizedBox(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _teamMember("assets/model1.jpg", "Sarah M.", "Senior Therapist", "5"),
              _teamMember(
                  "assets/model2.jpg", "James K.", "Massage Expert", "4.9"),
              _teamMember(
                  "assets/model1.jpg", "Emily R.", "Skin Specialist", "4.8"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _teamMember(
      String image, String name, String role, String rating) {
    return Container(
      width: 110,
      margin: const EdgeInsets.only(right: 14),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(radius: 36, backgroundImage: AssetImage(image)),
          const SizedBox(height: 8),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Text(
            role,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: AppColors.textLight),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, size: 14, color: Colors.amber),
              const SizedBox(width: 4),
              Text(rating),
            ],
          ),
        ],
      ),
    );
  }

  // ================= REVIEWS =================
  Widget _reviewsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader("Reviews", "See All"),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(child: Text("A")),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Anna S.",
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        Text("2 days ago",
                            style:
                            TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                  ),
                  Row(
                    children: List.generate(
                      5,
                          (index) => const Icon(Icons.star,
                          size: 14, color: Colors.amber),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                "Amazing experience! The Swedish massage was exactly what I needed.",
              ),

            ],
          ),
        ),
      ],
    );
  }



  Widget _sectionHeader(String title, String action) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600)),
        Text(action,
            style: TextStyle(
                color: AppColors.accent, fontWeight: FontWeight.w600)),
      ],
    );
  }

  // ================= BOTTOM BUTTON =================
  Widget _bottomButton() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          ),
          onPressed: () {},
          child: const Text(
            "Book Appointment",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
