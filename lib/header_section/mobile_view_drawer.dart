import 'package:flutter/material.dart';
import 'package:resume_web/components/widgets.dart';
import 'package:resume_web/constants/colors.dart';
import 'package:resume_web/constants/nav_items.dart';

class MobileViewDrawer extends StatelessWidget {
  final Function(int) onNavItemTap;

  const MobileViewDrawer({super.key, required this.onNavItemTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColor.scaffoldBg,
      child: ListView(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
                bottom: 20,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close),
              ),
            ),
          ),
          for (int i = 0; i < navIcons.length; i++)
            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              titleTextStyle: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: CustomColor.whitePrimary,
              ),
              leading: Icon(navIcons[i]),
              onTap: () {
                onNavItemTap(i);
              },
              title: Text(navTitles[i]),
            ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Divider(
              color: CustomColor.whitePrimary,
              thickness: 0.1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: downloadCvButton,
          )
        ],
      ),
    );
  }
}
