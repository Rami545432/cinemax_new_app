import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movify/core/routing/route_name.dart';
import 'package:movify/core/utils/enums/content_type.dart';
import 'package:movify/features/home/presentation/extensions/main_vertical_card_extention.dart';
import 'package:movify/features/home/presentation/widgets/stacked_cards_carousel/main_card.dart';
import 'package:movify/features/home/presentation/widgets/stacked_cards_carousel/mini_card.dart';
import 'package:movify/features/home/presentation/widgets/stacked_cards_carousel/stacked_cards_orbit_view.dart';
import 'package:movify/shared/presentation/models/card_display_model.dart';

class StackedCardsCarousel extends StatefulWidget {
  final List<CardDisplayModel> cardModel;

  const StackedCardsCarousel({super.key, required this.cardModel});

  @override
  State<StackedCardsCarousel> createState() => _StackedCardsCarouselState();
}

class _StackedCardsCarouselState extends State<StackedCardsCarousel>
    with SingleTickerProviderStateMixin {
  int current = 0;
  int _direction = 0;

  late final AnimationController _controller;

  bool get _isAnimating => _controller.isAnimating;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 580),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startSwipe(int direction) {
    if (widget.cardModel.length < 3 || _isAnimating) {
      return;
    }

    setState(() => _direction = direction);

    _controller.forward(from: 0).whenComplete(() {
      if (!mounted) {
        return;
      }

      setState(() {
        _controller.value = 0;
        if (_direction == 1) {
          current = (current + 1) % widget.cardModel.length;
        } else if (_direction == -1) {
          current =
              (current - 1 + widget.cardModel.length) % widget.cardModel.length;
        }
        _direction = 0;
      });
    });
  }

  void _openDetails() {
    final center = widget.cardModel[current];

    final routeName = center.contentType == ContentType.movies
        ? RouteName.movieDetail
        : RouteName.tvDetail;

    context.pushNamed(
      routeName,
      pathParameters: {'id': center.id.toString()},
      extra: center.toNavigationData(),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.cardModel.isEmpty) {
      return const SizedBox.shrink();
    }

    // fallback
    if (widget.cardModel.length < 3) {
      return SizedBox(
        height: 420,
        child: Center(child: MainCard(cardModel: widget.cardModel[current])),
      );
    }

    return GestureDetector(
      onTap: _openDetails,
      onHorizontalDragEnd: (details) {
        final v = details.primaryVelocity ?? 0;
        if (v < 0) {
          _startSwipe(1);
        }
        if (v > 0) {
          _startSwipe(-1);
        }
      },
      child: StackedCardsOrbitView(
        cards: widget.cardModel,
        current: current,
        direction: _direction,
        controller: _controller,
        buildMainCard: (model) => MainCard(cardModel: model),
        buildMiniCard: (img) => MiniCard(image: img),
      ),
    );
  }
}
