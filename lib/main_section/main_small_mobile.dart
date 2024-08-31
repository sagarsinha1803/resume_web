import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:resume_web/constants/colors.dart';
import 'package:resume_web/main_section/animation_intro.dart';

class MainSmallMobileView extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;

  const MainSmallMobileView({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight,
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      constraints: const BoxConstraints(minHeight: 560.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //avatar image
          ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(colors: [
                CustomColor.scaffoldBg.withOpacity(0.9),
                CustomColor.whitePrimary.withOpacity(0.9),
                CustomColor.yellowPrimary.withOpacity(0.9),
              ]).createShader(bounds);
            },
            // blendMode: BlendMode.srcATop,
            // child: Image.asset(
            //   "assets/geeky_monkey.png",
            //   width: screenWidth,
            //   height: screenHeight / 2.0,
            // ),
            child: Lottie.asset(
              'assets/animation/QPNON3mT8Y.json',
              width: screenWidth,
              height: screenHeight / 2.0,
            ),
          ),
          //into text
          const SizedBox(
            height: 30,
          ),
          const AnimatedIntro(
            fontsSize: 13,
            fontsHeight: 1.5,
            wordsSpacing: 1,
            fontFamily: 'Horizon',
          ),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
