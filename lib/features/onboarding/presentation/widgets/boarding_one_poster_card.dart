import 'package:flutter/material.dart';
import 'package:movify/features/home/presentation/widgets/card_image.dart';

class GradientPosterCard extends StatelessWidget {
  const GradientPosterCard({
    super.key,
    required this.image,
    required this.width,
    required this.height,
    required this.gradientColors,
  });
  final String image;
  final double width;
  final double height;
  final List<Color> gradientColors;

  @override
  Widget build(BuildContext context) => Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.8),
          blurRadius: 50,
          offset: const Offset(0, 25),
        ),
      ],
    ),
    child: Stack(
      fit: StackFit.expand,
      children: [
        // Poster Image
        CardImage(imageUrl: image),
        // Gradient Overlay
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                gradientColors[0].withValues(alpha: 0.6),
                gradientColors[1].withValues(alpha: 0.8),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
