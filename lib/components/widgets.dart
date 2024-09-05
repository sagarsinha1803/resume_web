import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_web/constants/colors.dart';
import 'package:resume_web/dto/skills_utils.dart';
import 'package:resume_web/skill_section/tween_circular_widget.dart';
import 'package:resume_web/util/common.dart';

ElevatedButton downloadCvButton = ElevatedButton(
  onPressed: downloadResume,
  style: ButtonStyle(
    backgroundColor: WidgetStateProperty.all(CustomColor.yellowPrimary),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
  child: Text(
    'Download CV',
    style: GoogleFonts.patrickHandSc(
      fontSize: 30,
      color: Colors.black,
    ),
  ),
);

Widget skillCard(SkillsUtils skilldata, controller) {
  return Card(
    elevation: 10,
    child: SizedBox(
      width: 200,
      height: 130,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              skilldata.title,
              style: GoogleFonts.patrickHandSc(
                fontSize: 20,
                color: CustomColor.whitePrimary,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                skilldata.image,
                width: 60,
                height: 60,
              ),
              TweenCirculerWidget(skillData: skilldata, controller: controller),
            ],
          )
        ],
      ),
    ),
  );
}
