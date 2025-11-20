import 'package:flutter/material.dart';

class AnimatedThemeSwitcher extends StatelessWidget {
  final Widget child;
  final Duration duration;
  const AnimatedThemeSwitcher({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      transitionBuilder: (child, animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: Container(
        key: ValueKey(Theme.of(context).brightness),
        child: child,
      ),
    );
  }
}
