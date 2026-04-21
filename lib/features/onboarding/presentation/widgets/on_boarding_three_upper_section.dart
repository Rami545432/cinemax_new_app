import 'package:cinemax_app_new/features/home/presentation/widgets/card_image.dart';
import 'package:cinemax_app_new/features/onboarding/presentation/widgets/gradient_overlay.dart';
import 'package:cinemax_app_new/features/onboarding/presentation/widgets/insight_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OnBoardingThreeUpperSection extends StatelessWidget {
  const OnBoardingThreeUpperSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    const image =
        'https://image.tmdb.org/t/p/w500/uWpG7GqfKGQqX4YMAo3nv5OrglV.jpg';
    return SizedBox(
      height: size.height * 0.6,
      child: Center(
        child: Animate(
          effects: const [
            FadeEffect(duration: Duration(milliseconds: 800)),
            ScaleEffect(
              begin: Offset(0.95, 0.95),
              end: Offset(1, 1),
              duration: Duration(milliseconds: 800),
            ),
          ],
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Movie Card
              Container(
                width: size.width * 0.7,
                height: size.height * 0.42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.8),
                      blurRadius: 40,
                      offset: const Offset(0, 20),
                    ),
                  ],
                ),
                child: const Stack(
                  fit: StackFit.expand,
                  children: [
                    CardImage(imageUrl: image),
                    GradientOverlay(),
                  ],
                ),
              ),

              const InsightChip(
                icon: Icons.star_rounded,
                label: '7.9 / 10',
                alignment: Alignment(-0.9, -0.2),
                color: Colors.amber,
              ),

              const InsightChip(
                icon: Icons.chat_bubble_outline,
                label: '88k Reviews',
                alignment: Alignment(0.9, -0.15),
                color: Color(0xFF60A5FA),
              ),

              const InsightChip(
                icon: Icons.play_circle_outline,
                label: 'Watch Trailer',
                alignment: Alignment(0.0, 0.5),
                color: Color(0xFF22C55E),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
