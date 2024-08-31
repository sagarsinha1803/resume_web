import 'package:flutter/material.dart';
import 'package:resume_web/constants/colors.dart';
import 'package:resume_web/constants/size.dart';
import 'package:resume_web/header_section/header_section.dart';
import 'package:resume_web/header_section/mobile_view_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final _scrollController = ScrollController();
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
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return buildHomePageLayout(
      screenSize: screenSize,
      scrollController: _scrollController,
      scaffoldKey: scaffoldKey,
      navBarkeys: navBarkeys,
    );
  }
}

void scrollToSection(int navIndex) {}

Widget buildHomePageLayout({
  required Size screenSize,
  required ScrollController scrollController,
  required GlobalKey<ScaffoldState> scaffoldKey,
  required List<GlobalKey> navBarkeys,
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
            ],
          ),
        ),
      );
    },
  );
}
