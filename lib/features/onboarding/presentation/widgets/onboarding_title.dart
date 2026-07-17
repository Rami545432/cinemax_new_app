import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:movify/core/utils/app_styles.dart';

class OnboardingTitle extends StatelessWidget {
  const OnboardingTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) => Animate(
    effects: const [
      FadeEffect(
        delay: Duration(milliseconds: 220),
        duration: Duration(milliseconds: 350),
      ),
      SlideEffect(
        delay: Duration(milliseconds: 220),
        begin: Offset(0, 0.04),
        end: Offset.zero,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeOut,
      ),
    ],
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: AppStyles.textStyle28(context).copyWith(
        fontWeight: FontWeight.w800,

        color: Colors.white,
        height: 1.2,
        letterSpacing: -0.5,
      ),
    ),
  );
}
