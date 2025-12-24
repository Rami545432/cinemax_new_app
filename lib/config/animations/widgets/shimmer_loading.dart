import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ShimmerLoading extends StatelessWidget {
  final Widget child;

  const ShimmerLoading({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Animate(
      onPlay: (controller) => controller.repeat(),
      effects: [
        ShimmerEffect(
          duration: const Duration(milliseconds: 1500),
          color: Colors.white.withValues(alpha: 0.5),
        ),
      ],
      child: child,
    );
  }
}

// Success Animation
