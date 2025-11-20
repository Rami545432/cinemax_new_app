import 'package:cinemax_app_new/features/onboarding/models/on_boarding_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';

class CustomLottie extends HookWidget {
  const CustomLottie({super.key, required this.onBoardingModel});
  final OnBoardingModel onBoardingModel;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController();
    return Lottie.asset(
      onBoardingModel.imageBackGround,
      fit: BoxFit.scaleDown,

      controller: controller,
      onLoaded: (composition) {
        controller
          ..duration = composition.duration
          ..repeat(count: 2);
      },
    );
  }
}
