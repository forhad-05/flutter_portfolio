import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/skills_controller.dart';
import '../theme/app_colors.dart';
import '../widgets/animated_skill_card.dart';
import '../widgets/section_header.dart';

class SkillsView extends GetView<SkillsController> {
  const SkillsView({super.key});

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
            title: "Technical Skills",
            subtitle: "My Expertise & Tools",
          ),
          const SizedBox(height: 20),

          // Category Filter Bar
          Obx(
            () => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: controller.categories.map((category) {
                  final isSelected =
                      controller.selectedCategory.value == category;

                  return Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: ChoiceChip(
                      label: Text(category),
                      selected: isSelected,
                      onSelected: (_) => controller.filterCategory(category),
                      selectedColor: AppColors.primary,
                      backgroundColor: AppColors.cardBg,
                      labelStyle: TextStyle(
                        color: isSelected
                            ? AppColors.textPrimary
                            : AppColors.textSecondary,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: isSelected
                              ? AppColors.secondary
                              : AppColors.surfaceLight,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 30),

          // Skills Grid using AnimatedSkillCard (Animation #2)
          Obx(
            () => Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: controller.filteredSkills.map((skill) {
                return AnimatedSkillCard(skill: skill);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
