import 'package:flutter/material.dart';
import 'package:movify/constants/welcome_assets.dart';
import 'package:movify/features/onboarding/presentation/widgets/build_on_boarding_content.dart';
import 'package:movify/features/onboarding/presentation/widgets/on_boarding_one_upper_section.dart';
import 'package:movify/l10n/app_localizations.dart';

class BoardingOneViewBody extends StatelessWidget {
  const BoardingOneViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BuildOnBoardingContent(
      upperSection: const OnboardingOneUpperSection(
        images: WelcomeAssets.column1Posters,
      ),
      colorsGradient: const [Color(0xFF14B8A6), Color(0xFF0F172A)],
      description: l10n.onboardingDesc1,
      title: l10n.onboardingTitle1,
      icon: Icons.auto_awesome,
    );
  }
}
