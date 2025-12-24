import 'package:cinemax_app_new/config/animations/animation_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedListItem extends StatelessWidget {
  final Widget child;
  final int index;

  const AnimatedListItem({super.key, required this.child, required this.index});

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: AppAnimations.listItemEntrance(index),
      child: child,
    );
  }
}
