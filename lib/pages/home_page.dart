import 'package:flutter/material.dart';
import 'package:resume_web/constants/colors.dart';
import 'package:resume_web/constants/size.dart';
import 'package:resume_web/contact_section/contact_section.dart';
import 'package:resume_web/footer_section/footer_section.dart';
import 'package:resume_web/header_section/header_section.dart';
import 'package:resume_web/header_section/mobile_view_drawer.dart';
import 'package:resume_web/main_section/main_section.dart';
import 'package:resume_web/project_section/project_tabview.dart';
import 'package:resume_web/skill_section/skill_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final _scrollController = ScrollController();
  late AnimationController _controller;
  bool backToTop = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final List<GlobalKey> navBarkeys = List.generate(4, (index) => GlobalKey());

  @override
  void initState() {
    _scrollController.addListener(() {
      setState(() {
        backToTop = _scrollController.offset >= 100 ? true : false;
      });
    });
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return buildHomePageLayout(
      screenSize: screenSize,
      scrollController: _scrollController,
      scaffoldKey: scaffoldKey,
      navBarkeys: navBarkeys,
      animationController: _controller,
    );
  }
}

void scrollToSection(int navIndex) {}

Widget buildHomePageLayout({
  required Size screenSize,
  required ScrollController scrollController,
  required GlobalKey<ScaffoldState> scaffoldKey,
  required List<GlobalKey> navBarkeys,
  required AnimationController animationController,
}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: CustomColor.scaffoldBg,
        endDrawer: constraints.maxWidth >= minDesktopWindowWidth
            ? null
            : SizedBox(
                width: 200,
                child: MobileViewDrawer(
                  onNavItemTap: (int navIndex) {
                    scaffoldKey.currentState?.closeEndDrawer();
                  },
                ),
              ),
        body: SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              HeaderSection(
                contrainScreeWidth: screenSize.width,
                scrollToSectionFn: scrollToSection,
                onDrawerItemTap: () =>
                    scaffoldKey.currentState?.openEndDrawer(),
              ),
              MainSection(
                key: navBarkeys[0],
                constrainScreenMaxWidth: screenSize.width,
                screenWidth: screenSize.width,
                screenHeight: screenSize.height,
              ),
              SkillSection(
                key: navBarkeys[1],
                screenWidth: screenSize.width,
                controller: animationController,
              ),
              SizedBox(
                height: screenSize.height,
                child: ProjectTabView(
                  key: navBarkeys[2],
                  constrainMaxWidth: constraints.maxWidth,
                  screenHeight: screenSize.height,
                  screenWidth: screenSize.width * 3,
                ),
              ),
              ContactSection(
                key: navBarkeys[3],
                screenWidth: screenSize.width,
              ),
              const SizedBox(
                height: 30,
              ),
              const Footer(),
            ],
          ),
        ),
      );
    },
  );
}
