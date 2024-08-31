import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_web/constants/colors.dart';
import 'package:resume_web/constants/size.dart';
import 'package:resume_web/skill_section/tween_skill_desktop.dart';
import 'package:resume_web/skill_section/tween_skill_mobile.dart';
import 'package:resume_web/skill_section/tween_skill_tablet.dart';

class SkillSection extends StatelessWidget {
  final double screenWidth;
  final AnimationController controller;

  const SkillSection({
    super.key,
    required this.screenWidth,
    required this.controller,
  });

  get children => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: CustomColor.bglight2.withOpacity(0.4)),
      width: screenWidth,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "What I can do ",
              style: GoogleFonts.sriracha(
                color: CustomColor.whitePrimary,
                fontSize: 40,
                wordSpacing: 5,
              ),
            ),
          ),
          skillSectionContent(controller, screenWidth),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}

Widget skillSectionContent(AnimationController controller, double screenWidth) {
  if (screenWidth >= minWindowChangeSizeSkillSection['tablet']!) {
    //Desktop version
    return TweenSkillDesktop(controller: controller);
  } else if (screenWidth >= minWindowChangeSizeSkillSection['mobile']! &&
      screenWidth < minWindowChangeSizeSkillSection['tablet']!) {
    // Tablet Version
    return TweenSkillTablet(controller: controller);
  } else {
    // Mobile Version
    return TweenSkillMobile(controller: controller);
  }
}
