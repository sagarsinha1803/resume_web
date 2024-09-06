class ServiceUtils {
  final String image;
  final String title;
  final String description;

  ServiceUtils({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<ServiceUtils> serviceUtilsList = [
  ServiceUtils(
    image: "assets/icons8-web-96.png",
    title: "FRONTEND DEVELOPMENT",
    description:
        "I have experience building good looking web or github pages using Flutter.",
  ),
  ServiceUtils(
    image: "assets/icons8-programming-96.png",
    title: "BACKEND DEVELOPMENT",
    description:
        "I have experience building RESTful APIs using Flask and Springboot.",
  ),
  ServiceUtils(
    image: "assets/icons8-desktop-96.png",
    title: "SCRIPTING",
    description: "I have experience building scripts using Python.",
  ),
];
