import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class BookingCard extends StatelessWidget {
  final String imagePath;
  final String status;
  final Color statusBg;
  final Color statusText;
  final String serviceName;
  final String staffName;
  final String date;
  final String time;
  final String price;

  const BookingCard({
    super.key,
    required this.imagePath,
    required this.status,
    required this.statusBg,
    required this.statusText,
    required this.serviceName,
    required this.staffName,
    required this.date,
    required this.time,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
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
          // -------- TOP CONTENT --------
          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    imagePath,
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(width: 12),

                // Right content (FIXED WITH EXPANDED)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Status + menu (FIXED)
                      Row(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: statusBg,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  status,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: statusText,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Icon(Icons.more_vert, size: 18),
                        ],
                      ),

                      const SizedBox(height: 8),

                      // Service name (SAFE)
                      Text(
                        serviceName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 2),

                      // Staff
                      Text(
                        "with $staffName",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.textLight,
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Date & time (SAFE ROW)
                      Wrap(
                        spacing: 10,
                        runSpacing: 6,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.calendar_today,
                                  size: 14,
                                  color: AppColors.textLight),
                              const SizedBox(width: 4),
                              Text(
                                date,
                                style: TextStyle(
                                    fontSize: 13,
                                    color: AppColors.textLight),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.access_time,
                                  size: 14,
                                  color: AppColors.textLight),
                              const SizedBox(width: 4),
                              Text(
                                time,
                                style: TextStyle(
                                    fontSize: 13,
                                    color: AppColors.textLight),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1),

          // -------- BOTTOM ACTIONS (FIXED) --------
          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                // Price
                Expanded(
                  child: Text(
                    price,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Actions (WRAPPED)
                Wrap(
                  spacing: 8,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.accent.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "Reschedule",
                        style: TextStyle(
                          color: AppColors.accent,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
