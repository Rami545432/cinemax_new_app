import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:movify/config/animations/animation_config.dart';

class ErrorAnimation extends StatelessWidget {
  final Widget child;

  const ErrorAnimation({super.key, required this.child});

  @override
  Widget build(BuildContext context) =>
      Animate(effects: AppAnimations.errorShake, child: child);
}
