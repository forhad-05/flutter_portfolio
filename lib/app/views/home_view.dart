import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../controllers/contact_controller.dart';
import '../theme/app_colors.dart';
import '../widgets/animated_profile_image.dart';
import '../widgets/custom_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCtrl = Get.find<HomeController>();
    final contactCtrl = Get.find<ContactController>();
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Container(
      constraints: const BoxConstraints(minHeight: 650),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20.0 : 60.0,
        vertical: 40.0,
      ),
      child: isMobile
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AnimatedProfileImage(),
                const SizedBox(height: 36),
                _buildHeroText(context, homeCtrl, contactCtrl, isMobile: true),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 6,
                  child: _buildHeroText(context, homeCtrl, contactCtrl, isMobile: false),
                ),
                const SizedBox(width: 40),
                const Expanded(
                  flex: 4,
                  child: Center(child: AnimatedProfileImage()),
                ),
              ],
            ),
    );
  }

  Widget _buildHeroText(
    BuildContext context,
    HomeController homeCtrl,
    ContactController contactCtrl, {
    required bool isMobile,
  }) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.secondary.withOpacity(0.15),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.secondary.withOpacity(0.4)),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.waving_hand_rounded, size: 16, color: AppColors.secondary),
              SizedBox(width: 8),
              Text(
                "Welcome to my Portfolio",
                style: TextStyle(
                  color: AppColors.secondary,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        RichText(
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          text: TextSpan(
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: isMobile ? 36 : 52,
                  fontWeight: FontWeight.bold,
                  height: 1.15,
                ),
            children: const [
              TextSpan(
                text: "Hi, I'm ",
                style: TextStyle(color: AppColors.textPrimary),
              ),
              TextSpan(
                text: "Md. Forhad Alam",
                style: TextStyle(color: AppColors.primaryLight),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            "Flutter Developer | AI Enthusiast | Web Developer",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.secondary,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "Passionate CSE Student crafting interactive web apps, cross-platform mobile experiences, and AI-driven software solutions.",
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 16,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            CustomButton(
              text: "Explore Projects",
              icon: Icons.rocket_launch_rounded,
              onPressed: () => homeCtrl.setNavIndex(4),
            ),
            CustomButton(
              text: "Contact Me",
              icon: Icons.mail_outline_rounded,
              isOutlined: true,
              onPressed: () => homeCtrl.setNavIndex(5),
            ),
          ],
        ),
      ],
    );
  }
}
