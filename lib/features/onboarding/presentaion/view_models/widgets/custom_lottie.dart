import 'package:cinemax_app_new/features/onboarding/models/on_boarding_list.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLottie extends StatefulWidget {
  const CustomLottie({super.key, required this.onBoardingModel});
  final OnBoardingModel onBoardingModel;

  @override
  State<CustomLottie> createState() => _CustomLottieState();
}

class _CustomLottieState extends State<CustomLottie>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      widget.onBoardingModel.imageBackGround,
      fit: BoxFit.scaleDown,
      controller: _controller,
      onLoaded: (composition) {
        _controller
          ..duration = composition.duration
          ..repeat(count: 2);
      },
    );
  }
}
