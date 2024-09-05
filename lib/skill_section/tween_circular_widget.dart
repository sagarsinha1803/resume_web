import 'package:flutter/material.dart';
import 'package:resume_web/constants/colors.dart';
import 'package:resume_web/dto/skills_utils.dart';

class TweenCirculerWidget extends StatefulWidget {
  final SkillsUtils skillData;
  final AnimationController controller;
  // final Animation animation;
  const TweenCirculerWidget({
    super.key,
    required this.skillData,
    required this.controller,
    // required this.animation,
  });

  @override
  State<TweenCirculerWidget> createState() => _TweenCirculerWidgetState();
}

class _TweenCirculerWidgetState extends State<TweenCirculerWidget> {
  @override
  Widget build(BuildContext context) {
    Animation animation =
        Tween<double>(begin: 0, end: widget.skillData.percentage / 100)
            .animate(widget.controller);
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) => Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 80,
              height: 80,
              child: CircularProgressIndicator(
                strokeWidth: 8,
                value: animation.value,
                color: CustomColor.yellowPrimary,
                backgroundColor: CustomColor.whitePrimary,
              ),
            ),
          ),
          Center(
            child: Text(
              '${(animation.value * 100).toInt()}%',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
