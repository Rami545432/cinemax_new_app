import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/features/onboarding/presentation/widgets/get_started_button.dart';
import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BoardingOneTextAndLogo extends StatelessWidget {
  const BoardingOneTextAndLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      // subtle vignette around the logo instead of a strong circle glow
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.45),
            blurRadius: 90,
            spreadRadius: 8,
          ),
        ],
      ),
      child: Column(
        children: [
          Animate(
            effects: [FadeEffect(delay: 500.ms, duration: 500.ms)],
            child: Image.asset(
              'assets/icons/app_icon_foreground.png',
              height: 138,
              width: 138,
            ),
          ),

          const SizedBox(height: 20),

          Animate(
            effects: [FadeEffect(delay: 1000.ms, duration: 500.ms)],
            child: Text(
              'Movify',
              style: AppStyles.textStyle28(
                context,
              ).copyWith(fontWeight: FontWeight.w900, letterSpacing: 0.3),
            ),
          ),

          const SizedBox(height: 6),

          Animate(
            effects: [FadeEffect(delay: 1500.ms, duration: 500.ms)],
            child: Text(
              l10n.onboardingTitle0,
              textAlign: TextAlign.center,
              style: AppStyles.textStyle20(context).copyWith(
                color: Colors.white.withValues(alpha: 0.9),
                height: 1.2,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const GetStartedButton(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
