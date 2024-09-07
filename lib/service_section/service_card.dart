import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
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
          color: const Color(0xFF1D1B20),
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
                          color: Color(0xFF1D1B20),
                        ),
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
                        color: const Color(0xFF1D1B20),
                        fontSize: 20,
                        wordSpacing: 5,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Html(
                data: service.description,
                // Optionally, style your HTML content
                style: {
                  "li": Style(
                    fontSize: FontSize(15.0),
                    fontWeight: FontWeight.w700,
                  ),
                  // Add more tag styles as needed
                },
              ),
            ),
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
