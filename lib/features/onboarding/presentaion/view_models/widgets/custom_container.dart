import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:cinemax_app_new/features/onboarding/presentaion/view_models/manger/pagecontrollerCubit/pagecontroller_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'on_boarding_button_and_indicator.dart';
import 'on_boarding_title_and_subtitle.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });
  final String title, subtitle, image;

  @override
  Widget build(BuildContext context) {
    final pageController = BlocProvider.of<PagecontrollerCubit>(
      context,
    ).pageController;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: AppPrimaryColors.dark,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: OnBoardingTitleAndSubtitle(title: title, subtitle: subtitle),
          ),
          Expanded(
            child: OnboardingButtonAndInicator(
              pageController: pageController,
              image: image,
            ),
          ),
        ],
      ),
    );
  }
}
