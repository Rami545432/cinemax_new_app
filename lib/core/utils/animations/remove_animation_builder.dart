import 'package:flutter/material.dart';

enum RemoveAnimationType {
  slideLeft,
  slideRight,
  fade,
  scale,
  slideAndFade,
  slideUp,
  slideDown,
  slideFromBottom,
}

class RemoveAnimationBuilder extends StatelessWidget {
  const RemoveAnimationBuilder({
    super.key,
    required this.child,
    this.animationType = RemoveAnimationType.slideAndFade,
    required this.animation,
    this.curve = Curves.easeInOut,
  });
  final Widget child;
  final RemoveAnimationType animationType;
  final Animation<double> animation;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final curverAnimation = CurvedAnimation(parent: animation, curve: curve);

    return switch (animationType) {
      RemoveAnimationType.slideLeft => SlideTransition(
        position: Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(-1, 0),
        ).animate(curverAnimation),
        child: child,
      ),
      RemoveAnimationType.slideRight => SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(curverAnimation),
        child: child,
      ),
      RemoveAnimationType.fade => FadeTransition(
        opacity: animation,
        child: child,
      ),
      RemoveAnimationType.scale => ScaleTransition(
        scale: animation,
        child: child,
      ),
      RemoveAnimationType.slideAndFade => SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.3),
          end: Offset.zero,
        ).animate(curverAnimation),
        child: FadeTransition(opacity: animation, child: child),
      ),
      RemoveAnimationType.slideUp => SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -1),
          end: Offset.zero,
        ).animate(curverAnimation),
        child: child,
      ),
      RemoveAnimationType.slideDown => SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).animate(curverAnimation),
        child: child,
      ),
      RemoveAnimationType.slideFromBottom => SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -1),
          end: Offset.zero,
        ).animate(curverAnimation),
        child: child,
      ),
    };
  }
}
