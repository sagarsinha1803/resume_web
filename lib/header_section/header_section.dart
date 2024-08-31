import 'package:flutter/material.dart';
import 'package:resume_web/constants/size.dart';
import 'package:resume_web/header_section/header_bar_desktop.dart';
import 'package:resume_web/header_section/header_bar_mobile.dart';

class HeaderSection extends StatelessWidget {
  final double contrainScreeWidth;
  final VoidCallback? onDrawerItemTap;
  final Function(int) scrollToSectionFn;

  const HeaderSection({
    super.key,
    required this.contrainScreeWidth,
    required this.scrollToSectionFn,
    this.onDrawerItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return contrainScreeWidth >= minWindowChangeSize["desktop"]!
        ? HeaderBar(
            onNavItemTap: (int navIndex) {
              scrollToSectionFn(navIndex);
            },
          )
        : HeaderMobile(
            onLogoTap: () {},
            onDrawerItemTap: onDrawerItemTap,
          );
  }
}
