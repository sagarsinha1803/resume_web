import 'package:flutter/material.dart';
import 'package:resume_web/constants/colors.dart';
import 'package:resume_web/constants/nav_items.dart';
import 'package:resume_web/header_section/nav.dart';
import 'package:resume_web/components/style.dart';

class HeaderBar extends StatelessWidget {
  final Function(int) onNavItemTap;

  const HeaderBar({
    super.key,
    required this.onNavItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: navBoxDecoration,
      child: Row(
        children: [
          Nav(
            onTap: () {},
          ),
          const Spacer(),
          for (int i = 0; i < navTitles.length; i++)
            Padding(
              padding: const EdgeInsets.only(
                right: 20,
              ),
              child: TextButton(
                onPressed: () {
                  onNavItemTap(i);
                },
                child: Text(
                  navTitles[i],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: CustomColor.whitePrimary,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
