import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/utils/app_colors.dart';

class SmothIndicatorHomeCards extends StatelessWidget {
  const SmothIndicatorHomeCards({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: _pageController,
      count: 3,
      onDotClicked: (index) {
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 250),
          curve: Curves.decelerate,
        );
      },
      effect: ExpandingDotsEffect(
        dotHeight: 8,
        dotWidth: 10,
        radius: 20,
        dotColor: const Color(0xff195461),
        activeDotColor: AppPrimaryColors.blueAccent,
      ),
    );
  }
}
