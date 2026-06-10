import 'package:flutter/material.dart';
import 'package:movify/features/home/presentation/widgets/stacked_cards_carousel/orbit_card_slot.dart';
import 'package:movify/features/home/presentation/widgets/stacked_cards_carousel/orbit_flow_delegate.dart';
import 'package:movify/features/home/presentation/widgets/stacked_cards_carousel/orbit_model.dart';
import 'package:movify/features/home/presentation/widgets/stacked_cards_carousel/orbit_utlis.dart';
import 'package:movify/shared/presentation/models/card_display_model.dart';

class StackedCardsOrbitView extends StatelessWidget {
  final List<CardDisplayModel> cards;
  final int current;
  final int direction; // +1 = next, -1 = prev, 0 = idle
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

  // ── Slot construction ───────────────────────────────────────────────────────
  // Called once per layout (width change), NOT per animation frame.
  List<OrbitSlot> _buildSlots(double w) {
    final visibleCount = visibleCountForWidth(w);
    final half = visibleCount ~/ 2;
    final stepX = (w * 0.18).clamp(115.0, 165.0);

    final slots = <OrbitSlot>[];
    for (int o = -half; o <= half; o++) {
      final dist = o.abs();
      slots.add(
        OrbitSlot(
          offset: o,
          x: (o * stepX).toDouble(),
          y: (dist * 10).toDouble(),
          rotation: degToRad(o * 7.5),
          scale: (1.0 - dist * 0.08).clamp(0.70, 1.0),
          opacity: (1.0 - dist * 0.18).clamp(0.28, 1.0),
          z: ((visibleCount ~/ 2) - dist).toDouble(),
        ),
      );
    }
    return slots;
  }

  // ── Card widget for a given slot ────────────────────────────────────────────

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final w = constraints.maxWidth;

      // Slots computed once here — not inside the delegate's paint loop
      final slots = _buildSlots(w);
      final arcBaseY = (w * 0.05).clamp(32.0, 58.0);

      // Children built once per layout — RepaintBoundary isolates each card
      // from the Flow's repaint cycle. ValueKey ensures Flutter reuses the
      // boundary across reorders.
      final children = <Widget>[
        for (final slot in slots)
          RepaintBoundary(
            key: ValueKey(orbitIndex(current, slot.offset, cards.length)),
            child: OrbitCardSlot(
              current: current,
              cards: cards,
              buildMainCard: buildMainCard,
              buildMediumCard: buildMediumCard,
              buildMiniCard: buildMiniCard,
              slot: slot,
            ),
          ),
      ];

      return Flow(
        // clipBehavior: Clip.none preserves your original Stack behaviour —
        // cards can extend beyond the 420 px height without being cut.
        clipBehavior: Clip.none,
        delegate: OrbitFlowDelegate(
          controller: controller,
          slots: slots,
          direction: direction,
          arcBaseY: arcBaseY,
        ),
        children: children,
      );
    },
  );
}
