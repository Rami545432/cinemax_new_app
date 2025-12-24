import 'package:cinemax_app_new/config/animations/animation_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedPageTransition extends StatelessWidget {
  final Widget child;

  const AnimatedPageTransition({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Animate(effects: AppAnimations.pageTransition, child: child);
  }
}
