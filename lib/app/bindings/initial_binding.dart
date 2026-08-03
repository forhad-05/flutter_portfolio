import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../controllers/skills_controller.dart';
import '../controllers/projects_controller.dart';
import '../controllers/contact_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController(), permanent: true);
    Get.put<SkillsController>(SkillsController(), permanent: true);
    Get.put<ProjectsController>(ProjectsController(), permanent: true);
    Get.put<ContactController>(ContactController(), permanent: true);
  }
}
