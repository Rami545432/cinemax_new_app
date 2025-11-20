import 'package:cinemax_app_new/core/utils/helper/responsive_padding.dart';
import 'package:cinemax_app_new/features/home/presentation/views_models/widgets/smoth_indicator_card.dart';
import 'package:flutter/material.dart';

import 'next_button.dart';

class OnboardingButtonAndInicator extends StatelessWidget {
  const OnboardingButtonAndInicator({
    super.key,
    required this.pageController,
    required this.image,
  });

  final PageController pageController;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getResponsivePadding(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SmothIndicatorHomeCards(pageController: pageController),
          NextButton(image: image, pageController: pageController),
        ],
      ),
    );
  }
}
