import 'package:flutter/material.dart';
import 'package:resume_web/constants/colors.dart';
import 'package:resume_web/constants/size.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return buildHomePageLayout(screenSize: screenSize);
  }
}

Widget buildHomePageLayout({
  required Size screenSize,
}) {
  return LayoutBuilder(builder: (context, constraints) {
    return Scaffold(
      backgroundColor: CustomColor.scaffoldBg,
      endDrawer: constraints.maxWidth >= minDesktopWindowWidth
          ? const Text("Nav Bar view")
          : const Text("Mobile view"),
    );
  });
}
