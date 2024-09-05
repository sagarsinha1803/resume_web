import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:resume_web/components/widgets.dart';
import 'package:resume_web/constants/colors.dart';
import 'package:resume_web/dto/skills_utils.dart';

class TweenSkillDesktop extends StatelessWidget {
  final AnimationController controller;

  const TweenSkillDesktop({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(colors: [
                  CustomColor.scaffoldBg.withOpacity(0.9),
                  CustomColor.whitePrimary.withOpacity(0.9),
                  CustomColor.yellowPrimary.withOpacity(0.9),
                ]).createShader(bounds);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 60),
                child: Lottie.asset(
                  'assets/animation/9cnb8OB2zC.json',
                  width: 500,
                  height: 500,
                ),
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Wrap(
                spacing: 2,
                runSpacing: 2,
                children: [
                  for (int i = 0; i < skillUtilList.length; i++)
                    skillCard(skillUtilList[i], controller),
                ],
              ),
            ),
            // Wrap(
            //   spacing: 10,
            //   runSpacing: 10,
            //   children: [
            //     SizedBox(
            //       width: 400,
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           for (int i = 0; i < skillList.length; i++)
            //             TweenLinerWidget(
            //               skillData: skillList[i],
            //               controller: controller,
            //             ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ],
    );
  }
}
