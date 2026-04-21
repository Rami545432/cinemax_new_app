import 'package:cinemax_app_new/features/onboarding/presentation/widgets/on_boarding_icon_badge.dart';
import 'package:cinemax_app_new/features/onboarding/presentation/widgets/onboarding_descreption.dart';
import 'package:cinemax_app_new/features/onboarding/presentation/widgets/onboarding_title.dart';
import 'package:flutter/material.dart';

class OnBoardingBottomSection extends StatelessWidget {
  const OnBoardingBottomSection({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.colorsGradient,
  });

  final String title;
  final String description;

  final IconData icon;
  final List<Color> colorsGradient;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      // Icon Badge - Blue
      OnBoardingIconBadge(icon: icon, colorsGradient: colorsGradient),

      const SizedBox(height: 20),

      // Title
      OnboardingTitle(title: title),

      const SizedBox(height: 12),

      // Description
      OnboardingDescription(description: description),
    ],
  );
}
