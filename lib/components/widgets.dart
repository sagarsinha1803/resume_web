import 'package:flutter/material.dart';
import 'package:resume_web/constants/colors.dart';

ElevatedButton downloadCvButton = ElevatedButton(
  onPressed: () {},
  style: ButtonStyle(
    backgroundColor: WidgetStateProperty.all(CustomColor.yellowPrimary),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
  child: const Text(
    'Download CV',
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
  ),
);
