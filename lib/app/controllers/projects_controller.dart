import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/project_model.dart';

class ProjectsController extends GetxController {
  final RxList<ProjectModel> projects = <ProjectModel>[].obs;
  final Rxn<ProjectModel> selectedProject = Rxn<ProjectModel>();

  @override
  void onInit() {
    super.onInit();
    projects.assignAll(ProjectModel.defaultProjects);
  }

  void selectProject(ProjectModel project) {
    selectedProject.value = project;
  }

  void clearSelection() {
    selectedProject.value = null;
  }

  Future<void> launchGithubUrl(String url) async {
    if (url.startsWith('http')) {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        Get.snackbar(
          'Error',
          'Could not launch $url',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } else {
      Get.snackbar(
        'Project Status',
        'Repository for this project is Coming Soon!',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
