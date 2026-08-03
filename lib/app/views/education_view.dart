import 'package:flutter/material.dart';
import '../models/education_model.dart';
import '../theme/app_colors.dart';
import '../widgets/section_header.dart';

class EducationView extends StatelessWidget {
  const EducationView({super.key});

  @override
  Widget build(BuildContext context) {
    final edu = EducationModel.defaultEducation;
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20.0 : 60.0,
        vertical: 40.0,
      ),
      child: Column(
        children: [
          const SectionHeader(
            title: "Education",
            subtitle: "Academic Background",
          ),
          const SizedBox(height: 30),
          Container(
            constraints: const BoxConstraints(maxWidth: 800),
            padding: const EdgeInsets.all(28.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.cardBg, AppColors.surface.withOpacity(0.4)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24.0),
              border: Border.all(color: AppColors.surfaceLight),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(
                        Icons.school_rounded,
                        color: AppColors.textPrimary,
                        size: 32,
                      ),
                    ),
                    const SizedBox(width: 18),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            edu.university,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "Department of ${edu.department}",
                            style: const TextStyle(
                              fontSize: 16,
                              color: AppColors.secondary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Divider(color: AppColors.surfaceLight),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 24,
                  runSpacing: 16,
                  children: [
                    _buildEduDetail(
                      icon: Icons.timeline_rounded,
                      title: "Current Status",
                      value: "${edu.semester} Semester",
                    ),
                    _buildEduDetail(
                      icon: Icons.calendar_month_rounded,
                      title: "Expected Graduation",
                      value: edu.graduationYear,
                    ),
                    _buildEduDetail(
                      icon: Icons.workspace_premium_rounded,
                      title: "Degree",
                      value: "B.Sc. in CSE",
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

  Widget _buildEduDetail({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.background.withOpacity(0.6),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.surfaceLight),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.glowCyan, size: 20),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 11,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14,
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
