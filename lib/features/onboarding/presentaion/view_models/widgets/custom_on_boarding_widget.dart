import 'package:cinemax_app_new/core/utils/size_config.dart';
import 'package:cinemax_app_new/features/onBoarding/presentaion/view_models/widgets/custom_container.dart';
import 'package:cinemax_app_new/features/onBoarding/presentaion/view_models/widgets/custom_lottie.dart';
import 'package:cinemax_app_new/features/onboarding/models/on_boarding_list.dart';
import 'package:flutter/material.dart';

class CustomOnBoardingWidget extends StatelessWidget {
  const CustomOnBoardingWidget({super.key, required this.onBoardingModel});
  final OnBoardingModel onBoardingModel;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        Expanded(
          flex: width < SizeConfig.desktop ? 2 : 1,
          child: CustomLottie(onBoardingModel: onBoardingModel),
        ),
        Expanded(
          flex: 1,
          child: CustomContainer(
            image: onBoardingModel.buttonImage,
            title: onBoardingModel.title,
            subtitle: onBoardingModel.description,
          ),
        ),
      ],
    );
  }
}
