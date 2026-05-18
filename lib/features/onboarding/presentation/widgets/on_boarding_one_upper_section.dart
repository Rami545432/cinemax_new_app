import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:movify/features/onboarding/presentation/widgets/boarding_one_poster_card.dart';
import 'package:movify/shared/presentation/widgets/size_config.dart';

class OnboardingOneUpperSection extends StatelessWidget {
  const OnboardingOneUpperSection({super.key, required this.images});
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final posterHeight = width < SizeConfig.mobile ? 224.0 : 280.0;
    final posterWidth = width < SizeConfig.mobile ? 160.0 : 200.0;
    return Center(
      child: SizedBox(
        height: posterHeight + 80.0,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            // Left Poster
            Positioned(
              left: posterWidth > 180 ? (width / 2) - 180 : 16,
              top: 32,
              child: Transform.rotate(
                angle: -0.14, // -8 degrees
                child: Animate(
                  effects: [
                    FadeEffect(delay: 100.ms, duration: 700.ms),
                    SlideEffect(
                      delay: 100.ms,
                      duration: 700.ms,
                      begin: const Offset(0, 0.3),
                      curve: Curves.easeOut,
                    ),
                  ],
                  child: GradientPosterCard(
                    image: images[0],
                    width: posterWidth,
                    height: posterHeight,
                    gradientColors: const [
                      Color(0xFF14B8A6),
                      Color(0xFF0F172A),
                    ],
                  ),
                ),
              ),
            ),

            // Right Poster
            Positioned(
              right: posterWidth > 180 ? (width / 2) - 180 : 16,
              top: 64,
              child: Transform.rotate(
                angle: 0.17, // +10 degrees
                child: Animate(
                  effects: [
                    FadeEffect(delay: 200.ms, duration: 700.ms),
                    SlideEffect(
                      delay: 200.ms,
                      duration: 700.ms,
                      begin: const Offset(0, 0.3),
                      curve: Curves.easeOut,
                    ),
                  ],
                  child: GradientPosterCard(
                    image: images[1],
                    width: posterWidth,
                    height: posterHeight,
                    gradientColors: const [
                      Color(0xFFF97316),
                      Color(0xFF000000),
                    ],
                  ),
                ),
              ),
            ),

            // Center Poster (Main Focus) - Blue themed
            Positioned(
              top: 0,
              child: Transform.scale(
                scale: 1.05,
                child: Animate(
                  effects: [
                    FadeEffect(delay: 400.ms, duration: 700.ms),
                    SlideEffect(
                      delay: 400.ms,
                      duration: 700.ms,
                      begin: const Offset(0, 0.3),
                      curve: Curves.easeOut,
                    ),
                  ],
                  child: GradientPosterCard(
                    image: images[2],
                    width: posterWidth,
                    height: posterHeight,
                    gradientColors: const [
                      Color(0xFF3B82F6), // Bright blue
                      Color(0xFF1E293B), // Dark blue-gray
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
