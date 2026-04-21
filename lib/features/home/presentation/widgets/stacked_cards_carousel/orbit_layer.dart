import 'package:flutter/material.dart';

class OrbitLayer extends StatelessWidget {
  final double x;
  final double y;
  final double rotation;
  final double scale;
  final double opacity;
  final bool isCenter;
  final Widget child;

  const OrbitLayer({
    super.key,
    required this.x,
    required this.y,
    required this.rotation,
    required this.scale,
    required this.opacity,
    required this.isCenter,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final shadowStrength = isCenter ? 1.0 : 0.55;

    return Positioned.fill(
      child: Center(
        child: Transform.translate(
          offset: Offset(x, y),
          child: Transform.rotate(
            angle: rotation,
            child: Transform.scale(
              scale: scale,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 26 * opacity * shadowStrength,
                      spreadRadius: 0.8,
                      offset: const Offset(0, 16),
                      color: Colors.black.withValues(
                        alpha: 0.22 * opacity * opacity * shadowStrength,
                      ),
                    ),
                  ],
                ),
                child: Opacity(opacity: opacity, child: child),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
