import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_web/constants/colors.dart';
import 'package:resume_web/dto/service_utils.dart';

class ServiceCard extends StatelessWidget {
  final ServiceUtils service;
  const ServiceCard({
    super.key,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Container(
        decoration: BoxDecoration(
          color: CustomColor.hintDark.withOpacity(0.3),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            // Image.asset(service.image),
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: CustomColor.yellowPrimary,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: CustomColor.hintDark),
                        child: Image.asset(
                          service.image,
                          height: 150,
                          width: 150,
                        ),
                      ),
                    ),
                    Text(
                      service.title,
                      style: GoogleFonts.sriracha(
                        color: CustomColor.bgLight1,
                        fontSize: 22,
                        wordSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Text(service.description),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(
        size.width / 4, size.height - 70, size.width / 2, size.height - 30);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, size.height - 70);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
