import 'package:flutter/material.dart';

/// Data Model representing a Skill entry.
class SkillModel {
  final String name;
  final String category; // e.g. "Mobile", "Language", "Web", "Database", "AI/ML", "Tools"
  final IconData icon;

  const SkillModel({
    required this.name,
    required this.category,
    required this.icon,
  });

  /// Real skills list strictly matching user provided details.
  static List<SkillModel> get defaultSkills => const [
        SkillModel(name: 'Flutter', category: 'Mobile & Frameworks', icon: Icons.flutter_dash),
        SkillModel(name: 'Dart', category: 'Languages', icon: Icons.code),
        SkillModel(name: 'Python', category: 'Languages', icon: Icons.terminal),
        SkillModel(name: 'C++', category: 'Languages', icon: Icons.memory),
        SkillModel(name: 'HTML', category: 'Web', icon: Icons.html),
        SkillModel(name: 'CSS', category: 'Web', icon: Icons.css),
        SkillModel(name: 'JavaScript', category: 'Web', icon: Icons.javascript),
        SkillModel(name: 'SQL', category: 'Database', icon: Icons.storage),
        SkillModel(name: 'Git', category: 'Tools', icon: Icons.source),
        SkillModel(name: 'React', category: 'Web', icon: Icons.web),
        SkillModel(name: 'Flask', category: 'Backend', icon: Icons.api),
        SkillModel(name: 'SQLite', category: 'Database', icon: Icons.data_object),
        SkillModel(name: 'Machine Learning', category: 'AI/ML', icon: Icons.psychology),
      ];
}
