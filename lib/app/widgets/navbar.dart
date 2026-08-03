import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../theme/app_colors.dart';
import 'animated_nav_button.dart';

class Navbar extends GetView<HomeController> {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isMobile = MediaQuery.of(context).size.width < 800;

      return Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        decoration: BoxDecoration(
          color: AppColors.background.withOpacity(0.9),
          border: const Border(
            bottom: BorderSide(color: AppColors.surfaceLight, width: 0.5),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Brand Logo
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'FA',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: 'Forhad',
                        style: TextStyle(color: AppColors.textPrimary),
                      ),
                      TextSpan(
                        text: ' .',
                        style: TextStyle(color: AppColors.secondary),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Desktop Navigation Items
            if (!isMobile)
              Row(
                children: List.generate(controller.navItems.length, (index) {
                  return AnimatedNavButton(
                    title: controller.navItems[index],
                    isActive: controller.selectedNavIndex.value == index,
                    onTap: () => controller.setNavIndex(index),
                  );
                }),
              ),

            // Mobile Menu Toggle Icon
            if (isMobile)
              IconButton(
                icon: Icon(
                  controller.isMobileMenuOpen.value
                      ? Icons.close_rounded
                      : Icons.menu_rounded,
                  color: AppColors.secondary,
                  size: 28,
                ),
                onPressed: () => controller.toggleMobileMenu(),
              ),
          ],
        ),
      );
    });
  }
}
