import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_web/constants/colors.dart';
import 'package:resume_web/skill_section/tween_circular_widget.dart';
import 'dart:html';

ElevatedButton downloadCvButton = ElevatedButton(
  onPressed: () {
    AnchorElement anchorElement =
        AnchorElement(href: '/lib/downloads/sagar-sinha-resume.pdf');
    anchorElement.download = "sagar-sinha-resume.pdf";
    anchorElement.click();
  },
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
    // style: TextStyle(
    //   fontSize: 16,
    //   fontWeight: FontWeight.w500,
    //   color: Colors.black,
    // ),
  ),
);

Widget flippingCardWidget(skilldata, controller) {
  return FlipCard(
    fill: Fill.fillBack,
    direction: FlipDirection.HORIZONTAL,
    side: CardSide.FRONT,
    front: Card(
      elevation: 10,
      child: SizedBox(
        width: 200,
        child: TweenCirculerWidget(
          skillData: skilldata,
          controller: controller,
        ),
      ),
    ),
    back: Card(
      elevation: 10,
      child: SizedBox(
        width: 200,
        child: Text(skilldata['description']),
      ),
    ),
  );
}
