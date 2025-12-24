import 'package:cinemax_app_new/config/animations/animation_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedCard extends StatelessWidget {
  final Widget child;
  final int? index;

  const AnimatedCard({super.key, required this.child, this.index});

  @override
  Widget build(BuildContext context) {
    final delay = index != null
        ? Duration(milliseconds: AppAnimations.staggerDelay(index!))
        : Duration(seconds: 2);

    return Animate(
      effects: [
        FadeEffect(duration: AppAnimations.slow, delay: delay),
        ScaleEffect(
          begin: const Offset(0.95, 0.95),
          end: const Offset(1.0, 1.0),
          duration: AppAnimations.slow,
          delay: delay,
          curve: AppAnimations.emphasizedCurve,
        ),
      ],
      child: child,
    );
  }
}
