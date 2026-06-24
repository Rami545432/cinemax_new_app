import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PremiumStaggeredEntrance extends StatelessWidget {
  const PremiumStaggeredEntrance({
    super.key,
    required this.child,
    required this.index,
    required this.isAnimated,
    required this.markAsAnimated,
    this.slideAxis = Axis.vertical,
  });

  final Widget child;
  
  /// Used to calculate the stagger delay. E.g. index 0 -> 0ms, index 1 -> 50ms.
  /// It automatically modulo 10s to prevent massive delays on long lists.
  final int index;
  
  /// Whether the item has already been animated once.
  final bool isAnimated;
  
  /// Callback to mark the item as animated.
  final VoidCallback markAsAnimated;

  /// Whether the subtle slide should be horizontal or vertical.
  final Axis slideAxis;

  @override
  Widget build(BuildContext context) {
    if (isAnimated) {
      return child; // Zero performance overhead if already animated
    }

    markAsAnimated();
    
    // We limit the stagger group to 10 items to cap the delay at 450ms
    final delay = ((index % 10) * 50).ms;
    const duration = Duration(milliseconds: 500);

    var animated = child.animate().fade(duration: duration, delay: delay);

    if (slideAxis == Axis.vertical) {
      animated = animated.slideY(
        begin: 0.1, // Subtle slide up
        duration: duration,
        curve: Curves.easeOutQuart,
      );
    } else {
      animated = animated.slideX(
        begin: 0.1, // Subtle slide from the side
        duration: duration,
        curve: Curves.easeOutQuart,
      );
    }

    return animated.scale(
      begin: const Offset(0.95, 0.95),
      curve: Curves.easeOutQuart,
    );
  }
}
