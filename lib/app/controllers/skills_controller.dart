import 'package:get/get.dart';
import '../models/skill_model.dart';

class SkillsController extends GetxController {
  final RxString selectedCategory = 'All'.obs;
  final RxList<SkillModel> skills = <SkillModel>[].obs;
  final RxList<String> categories = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    skills.assignAll(SkillModel.defaultSkills);
    
    final catSet = {'All', ...skills.map((s) => s.category)};
    categories.assignAll(catSet.toList());
  }

  void filterCategory(String category) {
    selectedCategory.value = category;
  }

  List<SkillModel> get filteredSkills {
    if (selectedCategory.value == 'All') {
      return skills;
    }
    return skills.where((s) => s.category == selectedCategory.value).toList();
  }
}
