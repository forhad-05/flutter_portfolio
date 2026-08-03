import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../theme/app_colors.dart';
import '../widgets/navbar.dart';
import '../widgets/footer.dart';
import 'home_view.dart';
import 'about_view.dart';
import 'education_view.dart';
import 'skills_view.dart';
import 'projects_view.dart';
import 'contact_view.dart';

class MainView extends GetView<HomeController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final views = [
      const HomeView(),
      const AboutView(),
      const EducationView(),
      const SkillsView(),
      const ProjectsView(),
      const ContactView(),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Column(
            children: [
              const Navbar(),
              Expanded(
                child: Obx(
                  () => SingleChildScrollView(
                    controller: controller.scrollController,
                    child: Column(
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 400),
                          switchInCurve: Curves.easeIn,
                          switchOutCurve: Curves.easeOut,
                          transitionBuilder: (child, animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(0.05, 0),
                                  end: Offset.zero,
                                ).animate(animation),
                                child: child,
                              ),
                            );
                          },
                          child: KeyedSubtree(
                            key: ValueKey<int>(controller.selectedNavIndex.value),
                            child: views[controller.selectedNavIndex.value],
                          ),
                        ),
                        const SizedBox(height: 40),
                        const Footer(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Mobile Drawer Overlay
          Obx(
            () => controller.isMobileMenuOpen.value
                ? Positioned(
                    top: 70,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      color: AppColors.background.withOpacity(0.96),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          controller.navItems.length,
                          (index) => ListTile(
                            title: Text(
                              controller.navItems[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight:
                                    controller.selectedNavIndex.value == index
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                color: controller.selectedNavIndex.value == index
                                    ? AppColors.secondary
                                    : AppColors.textPrimary,
                              ),
                            ),
                            onTap: () => controller.setNavIndex(index),
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
