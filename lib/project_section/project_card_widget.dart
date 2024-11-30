import 'package:flutter/material.dart';
import 'package:resume_web/constants/colors.dart';
import 'package:resume_web/dto/project_utils.dart';

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({
    super.key,
    required this.projectUtil,
  });

  final ProjectUtils projectUtil;

  // bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 290,
      width: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CustomColor.bglight2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Project Image
          Image.asset(
            projectUtil.image,
            height: 140,
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),

          // Project Title
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
            child: Text(
              projectUtil.title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: CustomColor.whitePrimary,
              ),
            ),
          ),

          // Project Subtitle
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
            child: Text(
              projectUtil.subTitle,
              style: const TextStyle(
                fontSize: 12,
                color: CustomColor.whiteSecondary,
              ),
            ),
          ),
          const Spacer(),
          //Project Footer
          Container(
            color: CustomColor.bgLight1,
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            child: Row(
              children: [
                const Text(
                  "Available On",
                  style: TextStyle(
                    color: CustomColor.yellowSecondary,
                    fontSize: 10,
                  ),
                ),
                const Spacer(),
                if (projectUtil.androidLink != null)
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      "assets/icons8-android-50.png",
                      width: 17,
                      color: CustomColor.whitePrimary,
                    ),
                  ),
                if (projectUtil.iosLink != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "assets/icons8-apple-logo-50.png",
                        width: 19,
                        color: CustomColor.whitePrimary,
                      ),
                    ),
                  ),
                if (projectUtil.webLink != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "assets/icons8-web-50.png",
                        width: 17,
                        color: CustomColor.whitePrimary,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
