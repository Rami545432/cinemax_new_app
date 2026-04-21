import 'package:cinemax_app_new/features/onboarding/presentation/widgets/build_on_boarding_content.dart';
import 'package:cinemax_app_new/features/onboarding/presentation/widgets/on_boarding_three_upper_section.dart';
import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class BoardingThreeViewBody extends StatelessWidget {
  const BoardingThreeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BuildOnBoardingContent(
      upperSection: const OnBoardingThreeUpperSection(),
      colorsGradient: const [Colors.orange, Colors.blue],
      description: l10n.onboardingDesc3,
      title: l10n.onboardingTitle3,
      icon: Icons.play_arrow_rounded,
    );
  }
}
