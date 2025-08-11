import 'package:flutter/material.dart';

class BuildAnimatedListItemTest extends StatelessWidget {
  const BuildAnimatedListItemTest({
    super.key,
    required this.child,
    required this.animation,
    required this.index,
  });
  final Widget child;
  final Animation<double> animation;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic)),
      child: FadeTransition(opacity: animation, child: child),
    );
  }
}
