import 'dart:async';

import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import '../../../../../../models/base_card_model.dart';
import 'horizontal_card.dart';

class HorizontalExpandablePageView extends StatefulWidget {
  const HorizontalExpandablePageView({super.key, required this.data});

  final List<BaseCardModel> data;

  @override
  State<HorizontalExpandablePageView> createState() =>
      _HorizontalExpandablePageViewState();
}

class _HorizontalExpandablePageViewState
    extends State<HorizontalExpandablePageView> {
  Timer? _autoScrollTimer;
  Timer? _resumeTimer;
  late final PageController _pageController;
  bool _isUserInteracting = false;

  @override
  void initState() {
    super.initState();

    final length = widget.data.length;
    final initialPage = length > 0 ? length * 1000 : 0;

    _pageController = PageController(
      initialPage: initialPage,
      viewportFraction: 0.9,
    );

    if (length > 1) {
      _startAutoScroll();
    }
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _resumeTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _autoScrollTimer?.cancel();
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (!mounted || !_pageController.hasClients || _isUserInteracting) return;

      final currentPage = _pageController.page?.round() ?? 0;
      final nextPage = currentPage + 1;

      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  void _onUserInteraction() {
    _isUserInteracting = true;

    _resumeTimer?.cancel();

    _resumeTimer = Timer(const Duration(seconds: 5), () {
      if (mounted) {
        _isUserInteracting = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final length = widget.data.length;
    if (length == 0) return const SizedBox.shrink();

    return GestureDetector(
      onPanStart: (_) => _onUserInteraction(),
      onTap: () => _onUserInteraction(),
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollStartNotification) {
            _onUserInteraction();
          }
          return false;
        },
        child: ExpandablePageView.builder(
          controller: _pageController,
          itemCount: 1000000,
          itemBuilder: (context, index) {
            final realIndex = index % length;
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: HorizontalCard(cardModel: widget.data[realIndex]),
            );
          },
        ),
      ),
    );
  }
}
