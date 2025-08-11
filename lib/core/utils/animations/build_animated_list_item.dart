import 'package:flutter/material.dart';

enum ListItemAnimationType {
  slideFromBottom,
  slideFromTop,
  slideFromLeft,
  slideFromRight,
  fade,
  scale,
  slideAndFade,
}

class BuildAnimatedListItem extends StatelessWidget {
  const BuildAnimatedListItem({
    super.key,
    required this.child,
    required this.animation,
    required this.index,
    this.animationType = ListItemAnimationType.slideFromBottom,
    this.curve = Curves.easeOutCubic,
    this.staggerDelay = 50,
  });

  final Widget child;
  final Animation<double> animation;
  final int index;
  final ListItemAnimationType animationType;
  final Curve curve;
  final int staggerDelay; // milliseconds

  @override
  Widget build(BuildContext context) {
    final delayedAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animation,
        curve: Interval((index * staggerDelay) / 1000.0, 1.0, curve: curve),
      ),
    );

    return switch (animationType) {
      ListItemAnimationType.slideFromBottom => SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).animate(delayedAnimation),
        child: FadeTransition(opacity: delayedAnimation, child: child),
      ),
      ListItemAnimationType.slideFromTop => SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -1),
          end: Offset.zero,
        ).animate(delayedAnimation),
        child: FadeTransition(opacity: delayedAnimation, child: child),
      ),
      ListItemAnimationType.slideFromLeft => SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-1, 0),
          end: Offset.zero,
        ).animate(delayedAnimation),
        child: FadeTransition(opacity: delayedAnimation, child: child),
      ),
      ListItemAnimationType.slideFromRight => SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(delayedAnimation),
        child: FadeTransition(opacity: delayedAnimation, child: child),
      ),
      ListItemAnimationType.fade => FadeTransition(
        opacity: delayedAnimation,
        child: child,
      ),
      ListItemAnimationType.scale => ScaleTransition(
        scale: delayedAnimation,
        child: FadeTransition(opacity: delayedAnimation, child: child),
      ),
      ListItemAnimationType.slideAndFade => SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.3),
          end: Offset.zero,
        ).animate(delayedAnimation),
        child: FadeTransition(opacity: delayedAnimation, child: child),
      ),
    };
  }
}
