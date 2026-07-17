import 'package:flutter/material.dart';

class SafeHeroCard extends StatelessWidget {
  const SafeHeroCard({super.key, required this.heroTag, required this.child});

  final String? heroTag;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // 1. Safe Tag Check: Do not render a Hero if the tag is null or empty.
    // An empty tag ('') can collide with other empty tags and crash the app.
    if (heroTag == null || heroTag!.isEmpty) {
      return child;
    }

    // 2. Safe Material Wrapper: Wrap the child in Material(transparency).
    // During a Hero flight, the widget moves to the overlay. If it lacks a
    // Material context, text will look yellow and ugly.
    return Hero(
      tag: heroTag!,
      createRectTween: (begin, end) =>
          MaterialRectArcTween(begin: begin, end: end),
      child: Material(type: MaterialType.transparency, child: child),
    );
  }
}
