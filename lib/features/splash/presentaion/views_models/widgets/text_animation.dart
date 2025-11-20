import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class TextAnimation extends StatelessWidget {
  const TextAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      totalRepeatCount: 1,
      animatedTexts: [
        TyperAnimatedText(
          speed: const Duration(milliseconds: 250),
          'CINEMAX',
          curve: Curves.fastLinearToSlowEaseIn,
          textStyle: AppStyles.textStyle28(
            context,
          ).copyWith(color: AppPrimaryColors.blueAccent),
        ),
      ],
    );
  }
}
