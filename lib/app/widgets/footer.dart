import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/contact_controller.dart';
import '../theme/app_colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final contactCtrl = Get.find<ContactController>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      decoration: const BoxDecoration(
        color: AppColors.cardBg,
        border: Border(
          top: BorderSide(color: AppColors.surfaceLight, width: 1),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialIconButton(
                icon: Icons.code,
                tooltip: 'GitHub',
                onTap: () => contactCtrl.launchURL(contactCtrl.github),
              ),
              const SizedBox(width: 16),
              _buildSocialIconButton(
                icon: Icons.work,
                tooltip: 'LinkedIn',
                onTap: () => contactCtrl.launchURL(contactCtrl.linkedin),
              ),
              const SizedBox(width: 16),
              _buildSocialIconButton(
                icon: Icons.facebook,
                tooltip: 'Facebook',
                onTap: () => contactCtrl.launchURL(contactCtrl.facebook),
              ),
              const SizedBox(width: 16),
              _buildSocialIconButton(
                icon: Icons.email,
                tooltip: 'Email',
                onTap: () => contactCtrl.sendEmail(),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            '© 2026 Md. Forhad Alam. All rights reserved.',
            style: TextStyle(
              color: AppColors.textMuted,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Built with Flutter & GetX Architecture',
            style: TextStyle(
              color: AppColors.secondary,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIconButton({
    required IconData icon,
    required String tooltip,
    required VoidCallback onTap,
  }) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(50),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.surface,
            border: Border.all(color: AppColors.surfaceLight),
          ),
          child: Icon(
            icon,
            size: 20,
            color: AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}
