import 'package:flutter/widgets.dart';

class OrbitCard {
  final int id;
  final OrbitSlot slot;
  final Widget widget;

  const OrbitCard({required this.id, required this.slot, required this.widget});
}

class OrbitSlot {
  final int offset; // -half..half
  final double x;
  final double y;
  final double rotation;
  final double scale;
  final double opacity;
  final double z;

  const OrbitSlot({
    required this.offset,
    required this.x,
    required this.y,
    required this.rotation,
    required this.scale,
    required this.opacity,
    required this.z,
  });
}

class ZLayer {
  final double z;
  final Widget child;
  const ZLayer({required this.z, required this.child});
}
