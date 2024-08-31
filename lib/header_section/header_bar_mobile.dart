import 'package:flutter/material.dart';
import 'package:resume_web/header_section/nav.dart';
import 'package:resume_web/components/style.dart';

class HeaderMobile extends StatelessWidget {
  final VoidCallback? onDrawerItemTap;
  final VoidCallback? onLogoTap;

  const HeaderMobile({
    super.key,
    this.onLogoTap,
    this.onDrawerItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.fromLTRB(40, 5, 20, 5),
      decoration: navBoxDecoration,
      child: Row(
        children: [
          Nav(
            onTap: onLogoTap,
          ),
          const Spacer(),
          IconButton(
            onPressed: onDrawerItemTap,
            icon: const Icon(Icons.menu),
          ),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}
