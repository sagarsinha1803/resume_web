import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:resume_web/constants/colors.dart';
import 'package:resume_web/dto/project_utils.dart';
import 'package:resume_web/project_section/project_card_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProjectsCarouselView extends StatefulWidget {
  final int windowSize;
  final int projectCount;
  // final double screenHeight;
  final List<ProjectUtils> projects;

  const ProjectsCarouselView({
    super.key,
    required this.windowSize,
    required this.projectCount,
    required this.projects,
    // required this.screenHeight,
  });

  @override
  State<ProjectsCarouselView> createState() => _ProjectsCarouselViewState();
}

class _ProjectsCarouselViewState extends State<ProjectsCarouselView> {
  int currentIndex = 0;
  int hoveredIndex = -1;
  @override
  Widget build(BuildContext context) {
    List<int> zerosArray = List<int>.filled(
        widget.windowSize < widget.projectCount
            ? widget.windowSize
            : widget.projectCount,
        0);
    int totalPages = (widget.projectCount / widget.windowSize).ceil();
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 10,
        ),
        CarouselSlider.builder(
          itemCount: (widget.projectCount / widget.windowSize).ceil(),
          itemBuilder: (context, index, realIndex) {
            int initIndex = (realIndex - 10000) * widget.windowSize;
            zerosArray.asMap().forEach(
              (index, value) {
                zerosArray[index] = (initIndex + index) % widget.projectCount;
              },
            );
            return Center(
              child: Wrap(
                spacing: 100,
                children: zerosArray.map((idx) {
                  return AnimatedScale(
                    scale: hoveredIndex == idx ? 1.4 : 1.0,
                    duration: const Duration(milliseconds: 200),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
                      child: MouseRegion(
                        onEnter: (_) {
                          setState(() {
                            hoveredIndex = idx;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            hoveredIndex = -1;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: CustomColor.bglight2,
                            boxShadow: hoveredIndex == idx
                                ? [
                                    BoxShadow(
                                      color: CustomColor.yellowSecondary.withOpacity(0.5),
                                      spreadRadius: 4,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3),
                                    ),
                                  ]
                                : [],
                          ),
                          child: ProjectCardWidget(
                            projectUtil: widget.projects[idx],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          },
          options: CarouselOptions(
            enableInfiniteScroll: (totalPages == 1) ? false : true,
            enlargeCenterPage: false,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
            viewportFraction: 1,
            height: 420,
          ),
        ),
        const SizedBox(height: 5),
        if (totalPages > 1) dotIndicator(currentIndex, totalPages),
      ],
    );
  }

  Widget dotIndicator(int currentIndex, int pageCount) {
    return AnimatedSmoothIndicator(
      // onDotClicked: (index) {
      //   setState(() {
      //     currentIndex = index;
      //     dotIndicator(currentIndex, pageCount);
      //   });
      // },
      activeIndex: currentIndex,
      count: pageCount,
      effect: const ExpandingDotsEffect(
          dotHeight: 10,
          dotWidth: 10,
          dotColor: CustomColor.bglight2,
          activeDotColor: CustomColor.yellowSecondary),
    );
  }
}
