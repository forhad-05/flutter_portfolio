import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/projects_controller.dart';
import '../theme/app_colors.dart';
import '../widgets/animated_project_card.dart';
import '../widgets/section_header.dart';
import '../widgets/custom_button.dart';

class ProjectsView extends GetView<ProjectsController> {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    int crossAxisCount = screenWidth > 1100 ? 2 : 1;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20.0 : 60.0,
        vertical: 40.0,
      ),
      child: Column(
        children: [
          const SectionHeader(
            title: "Featured Projects",
            subtitle: "My Portfolio & Repositories",
          ),
          const SizedBox(height: 30),
          Obx(
            () => GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.projects.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                childAspectRatio: isMobile ? 1.15 : 1.45,
              ),
              itemBuilder: (context, index) {
                final project = controller.projects[index];
                return AnimatedProjectCard(
                  project: project,
                  onTap: () => _showProjectDetailsDialog(context, project),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showProjectDetailsDialog(BuildContext context, project) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.cardBg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
            side: const BorderSide(color: AppColors.surfaceLight),
          ),
          title: Row(
            children: [
              const Icon(Icons.folder_special_rounded, color: AppColors.secondary),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  project.name,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Description",
                  style: TextStyle(
                    color: AppColors.secondary,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  project.description,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 15,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Technologies Used",
                  style: TextStyle(
                    color: AppColors.secondary,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: project.technologies.map<Widget>((tech) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.surfaceLight),
                      ),
                      child: Text(
                        tech,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 12,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Repository Link",
                  style: TextStyle(
                    color: AppColors.secondary,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 6),
                SelectableText(
                  project.githubUrl,
                  style: const TextStyle(
                    color: AppColors.primaryLight,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Close',
                style: TextStyle(color: AppColors.textMuted),
              ),
            ),
            CustomButton(
              text: project.githubUrl.startsWith('http') ? 'View Code' : 'Status',
              icon: Icons.launch_rounded,
              onPressed: () {
                Navigator.of(context).pop();
                controller.launchGithubUrl(project.githubUrl);
              },
            ),
          ],
        );
      },
    );
  }
}
