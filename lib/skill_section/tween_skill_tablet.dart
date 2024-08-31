import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:resume_web/components/widgets.dart';
import 'package:resume_web/constants/colors.dart';
import 'package:resume_web/constants/skill_items.dart';
import 'package:resume_web/skill_section/tween_linear_widget.dart';

class TweenSkillTablet extends StatelessWidget {
  final AnimationController controller;

  const TweenSkillTablet({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
              width: 400,
              height: 400,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Wrap(
                spacing: 1,
                runSpacing: 1,
                children: [
                  for (int i = 0; i < platformIcon.length; i++)
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: flippingCardWidget(platformIcon[i], controller),
                    ),
                ],
              ),
            ),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                SizedBox(
                  width: 400,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      for (int i = 0; i < skillList.length; i++)
                        TweenLinerWidget(
                          skillData: skillList[i],
                          controller: controller,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
