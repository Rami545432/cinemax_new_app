// ignore_for_file: deprecated_member_use

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:movify/features/home/presentation/widgets/stacked_cards_carousel/orbit_model.dart';
import 'package:movify/features/home/presentation/widgets/stacked_cards_carousel/orbit_utlis.dart';

// orbit_flow_delegate.dart
class OrbitFlowDelegate extends FlowDelegate {
  final AnimationController controller;
  final List<OrbitSlot> slots;
  final int direction;
  final double arcBaseY;

  OrbitFlowDelegate({
    required this.controller,
    required this.slots,
    required this.direction,
    required this.arcBaseY,
  }) : super(repaint: controller); // ← key: only repaints, no rebuild

  @override
  void paintChildren(FlowPaintingContext context) {
    final tRaw = controller.value;
    final t = const OvershootCurve().transform(tRaw);
    final arc = math.sin(t.clamp(0, 1) * math.pi) * (arcBaseY * 1.55);
    final arcSign = direction == 1 ? 1.0 : -1.0;

    // Sort by z before painting
    final indices = List.generate(slots.length, (i) => i);
    indices.sort((a, b) => _zOf(a, tRaw).compareTo(_zOf(b, tRaw)));

    for (final i in indices) {
      final from = slots[i];
      final to = _targetSlotFor(from);

      final dist = from.offset.abs();
      final delay = (dist * 0.03).clamp(0.0, 0.18);
      final tt = ((tRaw - delay) / (1 - delay)).clamp(0.0, 1.0);
      final eased = Curves.easeOutCubic.transform(tt);

      final x = _lerp(from.x, to.x, eased);
      final y =
          _lerp(from.y, to.y, eased) +
          arc * arcSign * _orbitFactor(from.offset);
      final rot = _lerp(from.rotation, to.rotation, eased);
      final scale = _lerp(from.scale, to.scale, eased);
      // final opacity = _lerp(from.opacity, to.opacity, eased);

      // Center of the Flow widget
      final cx = context.size.width / 2;
      final cy = context.size.height / 2;

      final matrix = Matrix4.identity()
        ..translate(cx + x, cy + y)
        ..rotateZ(rot)
        ..scale(scale)
        // offset back by half child size to center it
        ..translate(
          -context.getChildSize(i)!.width / 2,
          -context.getChildSize(i)!.height / 2,
        );

      context.paintChild(i, transform: matrix);
    }
  }

  double _orbitFactor(int offset) =>
      offset == 0 ? 0.22 : (0.45 + offset.abs() * 0.10);

  double _lerp(double a, double b, double t) => a + (b - a) * t;

  double _zOf(int i, double tRaw) {
    final from = slots[i];
    final to = _targetSlotFor(from);
    final delay = (from.offset.abs() * 0.03).clamp(0.0, 0.18);
    final tt = ((tRaw - delay) / (1 - delay)).clamp(0.0, 1.0);
    final eased = Curves.easeOutCubic.transform(tt);
    final jumpZ = (to.offset == 0 && eased > 0.5) ? 50.0 : 0.0;
    return from.z + jumpZ;
  }

  OrbitSlot _targetSlotFor(OrbitSlot from) {
    final idx = slots.indexWhere((s) => s.offset == from.offset);
    if (direction == 1) {
      return slots[(idx - 1).clamp(0, slots.length - 1)];
    } else if (direction == -1) {
      return slots[(idx + 1).clamp(0, slots.length - 1)];
    }
    return from;
  }

  @override
  bool shouldRepaint(OrbitFlowDelegate old) =>
      old.controller != controller ||
      old.direction != direction ||
      old.slots != slots;

  @override
  Size getSize(BoxConstraints constraints) => Size(constraints.maxWidth, 420);

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) =>
      const BoxConstraints(); // children size themselves
}
