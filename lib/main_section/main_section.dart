import 'package:flutter/material.dart';
import 'package:resume_web/constants/size.dart';
import 'package:resume_web/main_section/main_desktop.dart';
import 'package:resume_web/main_section/main_mobile.dart';
import 'package:resume_web/main_section/main_small_mobile.dart';

class MainSection extends StatelessWidget {
  final double constrainScreenMaxWidth;
  final double screenWidth;
  final double screenHeight;

  const MainSection({
    super.key,
    required this.constrainScreenMaxWidth,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    if (constrainScreenMaxWidth >= minWindowChangeSizeMainSection["tablet"]!) {
      return MainDesktopView(
        screenHeight: screenHeight,
        screenWidth: screenWidth,
      );
    } else if (constrainScreenMaxWidth >=
            minWindowChangeSizeMainSection["mobile"]! &&
        constrainScreenMaxWidth < minWindowChangeSizeMainSection["tablet"]!) {
      return MainMobileView(
        screenHeight: screenHeight,
        screenWidth: screenWidth,
      );
    } else {
      return MainSmallMobileView(
        screenHeight: screenHeight,
        screenWidth: screenWidth,
      );
    }
  }
}
