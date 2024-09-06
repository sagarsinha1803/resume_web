import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:resume_web/dto/service_utils.dart';
import 'package:resume_web/service_section/service_card.dart';

class ServiceDesktopView extends StatelessWidget {
  const ServiceDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    Size media_query = MediaQuery.of(context).size;
    double view_fraction = 0.3;
    bool autoPlay = false;
    if (media_query.width >= 1350) {
      view_fraction = 0.3;
    } else if (media_query.width < 1350 && media_query.width >= 810) {
      view_fraction = 0.35;
    } else if (media_query.width < 810 && media_query.width >= 630) {
      view_fraction = 0.45;
      autoPlay = true;
    } else if (media_query.width < 630 && media_query.width >= 440) {
      view_fraction = 0.65;
      autoPlay = true;
    } else if (media_query.width < 440 && media_query.width >= 375) {
      view_fraction = 0.75;
      autoPlay = true;
    } else if (media_query.width < 375 && media_query.width >= 345) {
      view_fraction = 0.8;
      autoPlay = true;
    } else if (media_query.width < 345 && media_query.width >= 330) {
      view_fraction = 0.85;
      autoPlay = true;
    } else {
      view_fraction = 0.9;
      autoPlay = true;
    }
    return CarouselSlider(
      options: CarouselOptions(
          pageSnapping: false,
          height: 550,
          viewportFraction: view_fraction,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
          aspectRatio: 1,
          autoPlay: autoPlay),
      items: serviceUtilsList.map(
        (eachService) {
          return Builder(builder: (context) {
            return SizedBox(
              width: 280,
              child: ServiceCard(
                service: eachService,
              ),
            );
          });
        },
      ).toList(),
    );
  }
}
