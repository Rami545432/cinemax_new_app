import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AppAnimations {
  // Durations
  static const veryFast = Duration(milliseconds: 100);
  static const fast = Duration(milliseconds: 200);
  static const normal = Duration(milliseconds: 300);
  static const slow = Duration(milliseconds: 500);
  static const verySlow = Duration(milliseconds: 800);

  // Curves
  static const standardCurve = Curves.easeInOut;
  static const emphasizedCurve = Curves.easeOutCubic;
  static const bounceCurve = Curves.elasticOut;

  // Stagger delays for lists
  static int staggerDelay(int index) => 50 * index;

  // Reusable effect configurations
  static List<Effect<void>> pageTransition = [
    const FadeEffect(duration: normal, curve: standardCurve),
    const SlideEffect(
      begin: Offset(0.2, 0),
      end: Offset.zero,
      duration: normal,
      curve: emphasizedCurve,
    ),
  ];

  static List<Effect<void>> listItemEntrance(int index) => [
    FadeEffect(
      duration: slow,
      delay: Duration(milliseconds: staggerDelay(index)),
    ),
    SlideEffect(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
      duration: slow,
      delay: Duration(milliseconds: staggerDelay(index)),
    ),
  ];

  static List<Effect<void>> cardEntrance = [
    const FadeEffect(duration: slow, curve: standardCurve),
    const ScaleEffect(
      begin: Offset(0.95, 0.95),
      end: Offset(1.0, 1.0),
      duration: slow,
      curve: emphasizedCurve,
    ),
  ];

  static List<Effect<void>> successPulse = [
    const ScaleEffect(
      begin: Offset(0.8, 0.8),
      end: Offset(1.0, 1.0),
      duration: fast,
      curve: bounceCurve,
    ),
    const FadeEffect(duration: fast),
  ];

  static List<Effect<void>> errorShake = [
    const ShakeEffect(duration: fast, hz: 4, offset: Offset(5, 0)),
  ];
}
