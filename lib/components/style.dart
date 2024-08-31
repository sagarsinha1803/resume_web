import 'package:flutter/material.dart';
import 'package:resume_web/constants/colors.dart';

// Nav Bar Decoration
BoxDecoration navBoxDecoration = BoxDecoration(
  gradient: const LinearGradient(
    colors: [
      Colors.transparent,
      CustomColor.bgLight1,
    ],
  ),
  borderRadius: BorderRadius.circular(100),
);

ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: CustomColor.yellowPrimary,
);

const TextStyle elevatedButtonTextStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w500,
  fontSize: 15,
);
