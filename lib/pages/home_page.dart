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

  void scrollToSection(int navIndex) {
    if (navIndex == 1) {
      // reload animation
      _controller.reset();
      _controller.forward();
    }
    final key = navBarkeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(
        milliseconds: 800,
      ),
      curve: Curves.easeInOut,
    );
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
      scrollToSection: scrollToSection,
      backToTop: backToTop,
    );
  }
}

Widget buildHomePageLayout({
  required Size screenSize,
  required ScrollController scrollController,
  required GlobalKey<ScaffoldState> scaffoldKey,
  required List<GlobalKey> navBarkeys,
  required AnimationController animationController,
  required void Function(int) scrollToSection,
  required bool backToTop,
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
        floatingActionButton: backToTop
            ? Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: FloatingActionButton(
                    backgroundColor: CustomColor.yellowPrimary.withOpacity(0.7),
                    onPressed: () {
                      scrollController.animateTo(
                        scrollController.position.minScrollExtent,
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: const Icon(Icons.arrow_upward),
                  ),
                ),
              )
            : null,
      );
    },
  );
}
