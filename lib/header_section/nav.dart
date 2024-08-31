import 'package:flutter/material.dart';
import 'package:resume_web/constants/colors.dart';

class Nav extends StatelessWidget {
  final VoidCallback? onTap;

  const Nav({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap,
      child: const Text(
        "<Sagar-Sinha />",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: CustomColor.yellowSecondary,
          // decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
