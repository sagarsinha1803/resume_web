class SkillsUtils {
  final String image;
  final String title;
  final int percentage;

  SkillsUtils({
    required this.image,
    required this.title,
    required this.percentage,
  });
}

List<SkillsUtils> skillUtilList = [
  SkillsUtils(
    image: "assets/icons8-flutter-144.png",
    title: "Flutter",
    percentage: 60,
  ),
  SkillsUtils(
    image: "assets/icons8-python-144.png",
    title: "Python",
    percentage: 90,
  ),
  SkillsUtils(
    image: "assets/icons8-flask-128.png",
    title: "Flask",
    percentage: 70,
  ),
  SkillsUtils(
    image: "assets/icons8-java-144.png",
    title: "Java",
    percentage: 70,
  ),
  SkillsUtils(
    image: "assets/icons8-docker-144.png",
    title: "Docker",
    percentage: 50,
  ),
  SkillsUtils(
    image: "assets/githubactions.png",
    title: "CI/CD",
    percentage: 50,
  ),
  SkillsUtils(
    image: "assets/sql.png",
    title: "SQL",
    percentage: 50,
  ),
];
