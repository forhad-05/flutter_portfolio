/// Data Model representing Education details strictly from prompt.
class EducationModel {
  final String university;
  final String department;
  final String semester;
  final String graduationYear;

  const EducationModel({
    required this.university,
    required this.department,
    required this.semester,
    required this.graduationYear,
  });

  static EducationModel get defaultEducation => const EducationModel(
        university: "International Islamic University Chittagong",
        department: "Computer Science and Engineering",
        semester: "6th",
        graduationYear: "2027",
      );
}
