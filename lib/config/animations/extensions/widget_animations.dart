import 'package:cinemax_app_new/config/animations/animation_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

extension AnimatedWidgetX on Widget {
  // Quick fade in from bottom
  Widget fadeInFromBottom({int delay = 0}) {
    return animate(delay: Duration(milliseconds: delay))
        .fadeIn(duration: AppAnimations.normal)
        .slideY(
          begin: 0.3,
          end: 0,
          duration: AppAnimations.normal,
          curve: AppAnimations.emphasizedCurve,
        );
  }

  // Quick scale in
  Widget scaleIn({int delay = 0}) {
    return animate(delay: Duration(milliseconds: delay))
        .scale(
          begin: const Offset(0.8, 0.8),
          duration: AppAnimations.normal,
          curve: AppAnimations.bounceCurve,
        )
        .fadeIn(duration: AppAnimations.fast);
  }

  // Fade in only
  Widget fadeInSimple({int delay = 0}) {
    return animate(
      delay: Duration(milliseconds: delay),
    ).fadeIn(duration: AppAnimations.normal);
  }

  // Slide from right
  Widget slideFromRight({int delay = 0}) {
    return animate(delay: Duration(milliseconds: delay))
        .fadeIn(duration: AppAnimations.normal)
        .slideX(
          begin: 1.0,
          end: 0,
          duration: AppAnimations.normal,
          curve: AppAnimations.emphasizedCurve,
        );
  }

  // Slide from left
  Widget slideFromLeft({int delay = 0}) {
    return animate(delay: Duration(milliseconds: delay))
        .fadeIn(duration: AppAnimations.normal)
        .slideX(
          begin: -1.0,
          end: 0,
          duration: AppAnimations.normal,
          curve: AppAnimations.emphasizedCurve,
        );
  }
}

extension ListWidgetX on List<Widget> {
  List<Widget> animateList() {
    return map(
      (widget) => widget
          .animate(delay: 100.ms)
          .fadeIn(duration: 280.ms)
          .slideY(begin: 0.08),
    ).toList();
  }
}
