import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:movify/core/utils/app_styles.dart';

class OnboardingDescription extends StatelessWidget {
  const OnboardingDescription({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) => Animate(
    effects: const [
      FadeEffect(
        delay: Duration(milliseconds: 320),
        duration: Duration(milliseconds: 350),
      ),
    ],
    child: Text(
      description,
      textAlign: TextAlign.center,
      style: AppStyles.textStyle24(context).copyWith(
        fontWeight: FontWeight.w500,
        color: const Color(0xFF9CA3AF),
        height: 1.6,
      ),
    ),
  );
}
