// import 'package:cinemax_app_new/core/utils/app_colors.dart';
// import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:cinemax_app_new/core/utils/app_styles.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:go_router/go_router.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) => Animate(
    effects: [FadeEffect(delay: 2000.ms, duration: 500.ms)],
    child: SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.8,
      height: MediaQuery.sizeOf(context).height * 0.06,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppPrimaryColors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          context.pushNamed(RouteName.onBoardingPageView);
        },
        child: Text('Get Started', style: AppStyles.textStyle20(context)),
      ),
    ),
  );
}
