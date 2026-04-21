import 'package:cinemax_app_new/constants/welcome_assets.dart';
import 'package:cinemax_app_new/features/onboarding/presentation/widgets/build_on_boarding_content.dart';
import 'package:cinemax_app_new/features/onboarding/presentation/widgets/on_boarding_two_upper_section.dart';
import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class BoardingTwoViewBody extends StatelessWidget {
  const BoardingTwoViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BuildOnBoardingContent(
      upperSection: const OnBoardingTwoUpperSection(
        posters: WelcomeAssets.column2Posters,
      ),
      colorsGradient: const [Color(0xFFEC4899), Color(0xFFBE185D)],
      description: l10n.onboardingDesc2,
      title: l10n.onboardingTitle2,
      icon: Icons.favorite,
    );
  }
}
