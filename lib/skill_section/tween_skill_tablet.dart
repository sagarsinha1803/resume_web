import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:resume_web/components/widgets.dart';
import 'package:resume_web/constants/colors.dart';
import 'package:resume_web/dto/skills_utils.dart';

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
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Wrap(
            spacing: 1,
            runSpacing: 1,
            children: [
              for (int i = 0; i < skillUtilList.length; i++)
                skillCard(skillUtilList[i], controller),
            ],
          ),
        ),
      ],
    );
  }
}
