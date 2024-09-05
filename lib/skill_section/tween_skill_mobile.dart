import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:resume_web/components/widgets.dart';
import 'package:resume_web/constants/colors.dart';
import 'package:resume_web/dto/skills_utils.dart';

class TweenSkillMobile extends StatelessWidget {
  final AnimationController controller;

  const TweenSkillMobile({
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
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Lottie.asset(
              'assets/animation/9cnb8OB2zC.json',
              width: 390,
              height: 390,
            ),
          ),
        ),
        CarouselSlider(
          items: skillUtilList.map((eachSkill) {
            return Builder(builder: (context) {
              return Container(
                child: skillCard(eachSkill, controller),
              );
            });
          }).toList(),
          options: CarouselOptions(
            height: 135,
            viewportFraction: 0.5,
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 2),
            enlargeStrategy: CenterPageEnlargeStrategy.zoom,
            pauseAutoPlayOnManualNavigate: true,
          ),
        ),
      ],
    );
  }
}
