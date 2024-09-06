import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_web/constants/colors.dart';

import 'package:resume_web/service_section/service_desktop_view.dart';

class ServiceSection extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;

  const ServiceSection({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      width: screenWidth,
      decoration: BoxDecoration(
        color: CustomColor.bglight2.withOpacity(0.2),
      ),
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
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            child: ServiceDesktopView(),
          ),
        ],
      ),
    );
  }
}
