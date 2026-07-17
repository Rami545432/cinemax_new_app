// core/router/route_transitions.dart
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Custom transition page builders for different animation types
class AppTransitions {
  /// Slide from right (Material default for Android)
  static CustomTransitionPage<void> slideFromRight({
    required Widget child,
    required GoRouterState state,
    Duration duration = const Duration(milliseconds: 300),
  }) => CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      final tween = Tween(
        begin: begin,
        end: end,
      ).chain(CurveTween(curve: curve));

      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );

  /// Slide from left
  static CustomTransitionPage<void> slideFromLeft({
    required Widget child,
    required GoRouterState state,
    Duration duration = const Duration(milliseconds: 300),
  }) => CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(-1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      final tween = Tween(
        begin: begin,
        end: end,
      ).chain(CurveTween(curve: curve));

      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );

  /// Slide from bottom (Modal style)
  static CustomTransitionPage<void> slideFromBottom({
    required Widget child,
    required GoRouterState state,
    Duration duration = const Duration(milliseconds: 400),
  }) => CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.easeOutCubic;

      final tween = Tween(
        begin: begin,
        end: end,
      ).chain(CurveTween(curve: curve));

      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );

  /// Fade transition (Subtle)
  static CustomTransitionPage<void> fade({
    required Widget child,
    required GoRouterState state,
    Duration duration = const Duration(milliseconds: 200),
  }) => CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );

  /// Scale transition (Zoom effect)
  static CustomTransitionPage<void> scale({
    required Widget child,
    required GoRouterState state,
    Duration duration = const Duration(milliseconds: 300),
  }) => CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const curve = Curves.easeInOut;
      final tween = Tween(begin: 0.8, end: 1.0).chain(CurveTween(curve: curve));

      return ScaleTransition(
        scale: animation.drive(tween),
        child: FadeTransition(opacity: animation, child: child),
      );
    },
  );

  /// Fade + Scale (Modern, smooth)
  static CustomTransitionPage<void> fadeScale({
    required Widget child,
    required GoRouterState state,
    Duration duration = const Duration(milliseconds: 300),
  }) => CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const curve = Curves.easeInOutCubic;

      final scaleTween = Tween(
        begin: 0.95,
        end: 1.0,
      ).chain(CurveTween(curve: curve));

      final fadeTween = Tween(
        begin: 0.0,
        end: 1.0,
      ).chain(CurveTween(curve: curve));

      return ScaleTransition(
        scale: animation.drive(scaleTween),
        child: FadeTransition(
          opacity: animation.drive(fadeTween),
          child: child,
        ),
      );
    },
  );

  /// iOS-style page transition
  static CustomTransitionPage<void> cupertino({
    required Widget child,
    required GoRouterState state,
    Duration duration = const Duration(milliseconds: 350),
  }) => CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.linearToEaseOut;

      final slideTween = Tween(
        begin: begin,
        end: end,
      ).chain(CurveTween(curve: curve));

      // Parallax effect on secondary animation (previous page)
      final secondarySlideTween = Tween(
        begin: Offset.zero,
        end: const Offset(-0.3, 0.0),
      ).chain(CurveTween(curve: curve));

      return Stack(
        children: [
          SlideTransition(
            position: secondaryAnimation.drive(secondarySlideTween),
            child: child,
          ),
          SlideTransition(position: animation.drive(slideTween), child: child),
        ],
      );
    },
  );

  /// Rotation + Fade (Creative)
  static CustomTransitionPage<void> rotationFade({
    required Widget child,
    required GoRouterState state,
    Duration duration = const Duration(milliseconds: 400),
  }) => CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const curve = Curves.easeInOut;

      final rotationTween = Tween(
        begin: 0.95,
        end: 1.0,
      ).chain(CurveTween(curve: curve));

      return RotationTransition(
        turns: animation.drive(Tween(begin: 0.02, end: 0.0)),
        child: ScaleTransition(
          scale: animation.drive(rotationTween),
          child: FadeTransition(opacity: animation, child: child),
        ),
      );
    },
  );

  /// No transition (instant)
  static NoTransitionPage<void> noTransition({
    required Widget child,
    required GoRouterState state,
  }) => NoTransitionPage(key: state.pageKey, child: child);

  /// Shared axis transition (Material 3 style)
  static CustomTransitionPage<void> sharedAxisX({
    required Widget child,
    required GoRouterState state,
    Duration duration = const Duration(milliseconds: 300),
  }) => CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.horizontal,
          child: child,
        ),
  );

  /// Shared Axis Transition (Y-axis)
  /// Best for: Bottom sheets, dialogs
  static CustomTransitionPage<void> sharedAxisY({
    required Widget child,
    required GoRouterState state,
    Duration duration = const Duration(milliseconds: 300),
  }) => CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.vertical,
          child: child,
        ),
  );

  /// Shared Axis Transition (Z-axis / Scaled)
  /// Best for: Step-by-step flows, wizards
  static CustomTransitionPage<void> sharedAxisZ({
    required Widget child,
    required GoRouterState state,
    Duration duration = const Duration(milliseconds: 300),
  }) => CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.scaled,
          child: child,
        ),
  );

  static CustomTransitionPage<void> fadeThrough({
    required Widget child,
    required GoRouterState state,
    Duration duration = const Duration(milliseconds: 300),
  }) => CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeThroughTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        ),
  );

  /// Fade Scale Transition (Container Transform style)
  /// Best for: Expanding a card to full screen
  static CustomTransitionPage<void> fadeScaleAnimation({
    required Widget child,
    required GoRouterState state,
    Duration duration = const Duration(milliseconds: 300),
  }) => CustomTransitionPage(
    key: state.pageKey,
    child: child,

    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeScaleTransition(animation: animation, child: child),
  );
}
