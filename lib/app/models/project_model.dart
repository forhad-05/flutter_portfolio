/// Data Model representing a Project entry.
class ProjectModel {
  final String name;
  final String description;
  final List<String> technologies;
  final String githubUrl;

  const ProjectModel({
    required this.name,
    required this.description,
    required this.technologies,
    required this.githubUrl,
  });

  /// Official projects strictly matching provided details.
  static List<ProjectModel> get defaultProjects => const [
        ProjectModel(
          name: "DeadLock Hero",
          description:
              "DeadLock Hero is a comprehensive interactive educational web application designed to simulate and visualize operating system deadlock scenarios. It simplifies complex OS concepts like the Banker's Algorithm and Resource Allocation Graphs through real-time visualization.",
          technologies: [
            "React 19",
            "Vite",
            "Tailwind CSS v4",
            "Framer Motion",
            "Recharts",
            "React Flow",
            "React Router DOM"
          ],
          githubUrl: "https://github.com/forhad-05/DeadLock-Hero",
        ),
        ProjectModel(
          name: "Alexa Home Automation",
          description:
              "Voice-controlled home automation system using Amazon Alexa, Arduino IoT Cloud, and ESP8266 (NodeMCU). Appliances can be controlled remotely using Alexa or Arduino IoT Cloud.",
          technologies: [
            "ESP8266",
            "Arduino IoT Cloud",
            "Relay Module",
            "Amazon Alexa"
          ],
          githubUrl: "https://github.com/forhad-05/Alexa-Home-Automation-",
        ),
        ProjectModel(
          name: "FitMate",
          description: "AI-powered fitness recommendation system.",
          technologies: [
            "Flutter",
            "Flask",
            "Python",
            "SQLite",
            "Logistic Regression",
            "Gemini API"
          ],
          githubUrl: "Coming Soon",
        ),
        ProjectModel(
          name: "SmartShop",
          description: "E-commerce web application.",
          technologies: ["HTML", "Tailwind CSS", "JavaScript"],
          githubUrl: "Coming Soon",
        ),
      ];
}
