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
    title: "FLUTTER UI SERVICES",
    description: r"""
        <ul>
          <li>Responsive Web design</li>
          <li>Custom UI design for Android, iOS & Windows.</li>
          <li>Integrate New Widgets</li>
          <li>Optimizing Widgets</li>
          <li>Bug Fixing</li>
          <li>UI Performance Optimization</li>
          <li>Clean Architecture Design</li>
        </ul>
        """,
  ),
  ServiceUtils(
    image: "assets/icons8-programming-96.png",
    title: "BACKEND SERVICES",
    description: r"""
        <ul>
          <li>API Development</li>
          <li>API Enhancement</li>
          <li>API Integration</li>
          <li>Cloud Deployment</li>
          <li>Code Migration</li>
          <li>Bug Fixing</li>
          <li>Performance Optimization</li>
          <li>Resource Scaling</li>
          <li>Database Migration</li>
          <li>HLD and LLD Design</li>
          <li>Clean Architecture Design</li>
        </ul>
        """,
  ),
  ServiceUtils(
    image: "assets/icons8-desktop-96.png",
    title: "SCRIPTING SERVICES",
    description: r"""
        <ul>
          <li>Web Scraping</li>
          <li>Data Extraction</li>
          <li>Network Automation</li>
          <li>Bug Fixing</li>
          <li>Code Optimization</li>
          <li>Automation Script Development</li>
          <li>Script Migration</li>
        </ul>
        """,
  ),
];
