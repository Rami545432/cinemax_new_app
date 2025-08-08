import 'package:cinemax_app_new/features/onboarding/models/on_boarding_list.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_on_boarding_widget.dart';

class OnBoardingBodyThree extends StatelessWidget {
  const OnBoardingBodyThree({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOnBoardingWidget(onBoardingModel: onBoardingList[2]);
  }
}
