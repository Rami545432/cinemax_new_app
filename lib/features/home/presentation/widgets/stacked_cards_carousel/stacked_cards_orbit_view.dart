import 'dart:math' as math;
import 'package:cinemax_app_new/features/home/presentation/widgets/stacked_cards_carousel/orbit_layer.dart';
import 'package:cinemax_app_new/features/home/presentation/widgets/stacked_cards_carousel/orbit_model.dart';
import 'package:cinemax_app_new/features/home/presentation/widgets/stacked_cards_carousel/orbit_utlis.dart';
import 'package:cinemax_app_new/shared/presentation/models/card_display_model.dart';
import 'package:flutter/material.dart';

class StackedCardsOrbitView extends StatelessWidget {
  final List<CardDisplayModel> cards;
  final int current;
  final int direction; // +1 next, -1 prev, 0 idle
  final AnimationController controller;

  final Widget Function(CardDisplayModel model) buildMainCard;
  final Widget Function(String image) buildMiniCard;
  final Widget Function(String image)? buildMediumCard;

  const StackedCardsOrbitView({
    super.key,
    required this.cards,
    required this.current,
    required this.direction,
    required this.controller,
    required this.buildMainCard,
    required this.buildMiniCard,
    this.buildMediumCard,
  });

  int _index(int offset) {
    final length = cards.length;
    return (current + offset + length) % length;
  }

  OrbitSlot _targetSlotFor(List<OrbitSlot> slots, OrbitSlot from) {
    final idx = slots.indexWhere((s) => s.offset == from.offset);

    if (direction == 1) {
      // swipe left => move towards right visually (same as your logic)
      return slots[(idx - 1).clamp(0, slots.length - 1)];
    } else if (direction == -1) {
      return slots[(idx + 1).clamp(0, slots.length - 1)];
    }
    return from;
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final w = constraints.maxWidth;

      final visibleCount = visibleCountForWidth(w);
      final half = visibleCount ~/ 2;

      final arcBaseY = (w * 0.05).clamp(32.0, 58.0);
      final stepX = (w * 0.18).clamp(115.0, 165.0);

      // ----- slots
      final slots = <OrbitSlot>[];
      for (int o = -half; o <= half; o++) {
        final dist = o.abs();

        final scale = (1.0 - dist * 0.08).clamp(0.70, 1.0);
        final opacity = (1.0 - dist * 0.18).clamp(0.28, 1.0);

        final rotation = degToRad(o * 7.5);
        final x = o * stepX;
        final y = (dist * 10).toDouble();

        final z = (half - dist).toDouble();

        slots.add(
          OrbitSlot(
            offset: o,
            x: x.toDouble(),
            y: y,
            rotation: rotation,
            scale: scale,
            opacity: opacity,
            z: z,
          ),
        );
      }

      // ----- orbit cards
      final orbitCards = <OrbitCard>[];
      for (final slot in slots) {
        final index = _index(slot.offset);
        final model = cards[index];

        final abs = slot.offset.abs();

        final Widget child = switch (abs) {
          0 => buildMainCard(model),
          // 1 =>
          //   (buildMediumCard != null)
          //       ? buildMediumCard!(model.cardImage)
          //       : buildMiniCard(model.cardImage),
          _ => buildMiniCard(model.posterPath),
        };

        orbitCards.add(OrbitCard(id: index, slot: slot, widget: child));
      }

      return SizedBox(
        height: 420,
        width: double.infinity,
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            final tRaw = controller.value;

            final t = const OvershootCurve().transform(tRaw);
            final arc = math.sin(t.clamp(0, 1) * math.pi) * (arcBaseY * 1.55);

            final children = <ZLayer>[];

            for (final card in orbitCards) {
              final from = card.slot;
              final to = _targetSlotFor(slots, from);

              final dist = from.offset.abs();
              final delay = (dist * 0.03).clamp(0.0, 0.18);

              final tt = ((tRaw - delay) / (1 - delay)).clamp(0.0, 1.0);
              final eased = Curves.easeOutCubic.transform(tt);

              final x = lerpDouble(from.x, to.x, eased);
              final y = lerpDouble(from.y, to.y, eased);
              final rot = lerpDouble(from.rotation, to.rotation, eased);
              final scale = lerpDouble(from.scale, to.scale, eased);
              final opacity = lerpDouble(from.opacity, to.opacity, eased);

              final arcSign = direction == 1 ? 1.0 : -1.0;

              final orbitFactor = (from.offset == 0)
                  ? 0.22
                  : (0.45 + (from.offset.abs() * 0.10));

              final yArc = y + arc * arcSign * orbitFactor;

              final jumpZ = (to.offset == 0 && eased > 0.50) ? 50.0 : 0.0;
              final z = from.z + jumpZ;

              children.add(
                ZLayer(
                  z: z,
                  child: OrbitLayer(
                    x: x,
                    y: yArc,
                    rotation: rot,
                    scale: scale,
                    opacity: opacity,
                    isCenter: to.offset == 0,
                    child: RepaintBoundary(child: card.widget),
                  ),
                ),
              );
            }

            children.sort((a, b) => a.z.compareTo(b.z));

            return Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: children.map((e) => e.child).toList(),
            );
          },
        ),
      );
    },
  );
}

/// Render layer
