import 'package:flutter/material.dart';
import 'package:movify/features/onboarding/presentation/widgets/floating_particles_effect.dart';
import 'package:movify/features/onboarding/presentation/widgets/gradient_overlay.dart';
import 'package:movify/features/onboarding/presentation/widgets/on_boarding_bottom_section.dart';
import 'package:movify/shared/presentation/widgets/size_config.dart';

class BuildOnBoardingContent extends StatelessWidget {
  const BuildOnBoardingContent({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.colorsGradient,
    required this.upperSection,
  });
  final String title;
  final String description;
  final IconData icon;
  final List<Color> colorsGradient;
  final Widget upperSection;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.widthOf(context);
    final horizontalPadding = width < SizeConfig.tablet ? 24.0 : 48.0;
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  // Floating particles effect
                  ...List.generate(15, (index) {
                    final random = index * 0.1;
                    return Positioned(
                      left: (index * 25.0) % width,
                      top: (index * 40.0) % 400,
                      child: FloatingParticlesEffect(random: random),
                    );
                  }),
                  // Movie Posters
                  upperSection,
                  // Gradient Overlay
                  const Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: 250,
                    child: GradientOverlay(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: OnBoardingBottomSection(
                  title: title,
                  description: description,
                  icon: icon,
                  colorsGradient: colorsGradient,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
