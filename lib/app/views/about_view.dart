import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/section_header.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20.0 : 60.0,
        vertical: 40.0,
      ),
      child: Column(
        children: [
          const SectionHeader(
            title: "About Me",
            subtitle: "Personal Summary",
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(28.0),
            decoration: BoxDecoration(
              color: AppColors.cardBg,
              borderRadius: BorderRadius.circular(24.0),
              border: Border.all(color: AppColors.surfaceLight),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.person_pin_rounded,
                      color: AppColors.secondary,
                      size: 28,
                    ),
                    SizedBox(width: 12),
                    Text(
                      "Md. Forhad Alam",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Divider(color: AppColors.surfaceLight),
                const SizedBox(height: 16),
                const Text(
                  "I am a Computer Science and Engineering student at the International Islamic University Chittagong. I enjoy building modern web and mobile applications using Flutter, React, and Python. I am passionate about Artificial Intelligence, Machine Learning, and software development. I enjoy learning new technologies and solving real-world problems through software.",
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    height: 1.8,
                  ),
                ),
                const SizedBox(height: 24),
                Wrap(
                  spacing: 20,
                  runSpacing: 16,
                  children: [
                    _buildInfoBadge(
                      icon: Icons.school_rounded,
                      label: "Institute",
                      value: "IIUC",
                    ),
                    _buildInfoBadge(
                      icon: Icons.computer_rounded,
                      label: "Department",
                      value: "CSE",
                    ),
                    _buildInfoBadge(
                      icon: Icons.location_city_rounded,
                      label: "Location",
                      value: "Chittagong, Bangladesh",
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

  Widget _buildInfoBadge({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.surfaceLight),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.primaryLight, size: 20),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 11,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
