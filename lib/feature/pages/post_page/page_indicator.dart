import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndicator extends StatelessWidget {
  final int count;
  final PageController controller;

  const PageIndicator({
    Key? key,
    required this.controller, required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: count,
      effect: const WormEffect(
        spacing: 16,
        dotColor: Color(0xffb7b7b7),
        activeDotColor: Color(0xffc04757),
      ),
      onDotClicked: (index) => controller.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.easeIn),
    );
  }
}
