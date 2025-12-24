import 'package:cinemax_app_new/config/animations/animation_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ErrorAnimation extends StatelessWidget {
  final Widget child;

  const ErrorAnimation({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Animate(effects: AppAnimations.errorShake, child: child);
  }
}
