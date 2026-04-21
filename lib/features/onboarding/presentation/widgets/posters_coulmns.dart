import 'package:cinemax_app_new/features/onboarding/presentation/widgets/infinite_scrolling_list_view.dart';
import 'package:cinemax_app_new/shared/presentation/widgets/adaptive_layout_widget.dart';
import 'package:flutter/material.dart';

class PostersCoulmns extends StatelessWidget {
  final List<String> column1Posters;
  final List<String> column2Posters;
  final List<String> column3Posters;

  const PostersCoulmns({
    super.key,
    required this.column1Posters,
    required this.column2Posters,
    required this.column3Posters,
  });

  static const double _itemExtent = 166.0;
  static const double _baseOffset = 5000.0;

  @override
  Widget build(BuildContext context) => AdaptiveLayoutWidget(
    mobile: (context) => MobilePosterColumns(
      column1Posters: column1Posters,
      baseOffset: _baseOffset,
      column3Posters: column3Posters,
      column2Posters: column2Posters,
      itemExtent: _itemExtent,
    ),
    desktop: (context) => TabletPosterColumns(
      column1Posters: column1Posters,
      baseOffset: _baseOffset,
      column3Posters: column3Posters,
      column2Posters: column2Posters,
      itemExtent: _itemExtent,
    ),
    tablet: (context) => TabletPosterColumns(
      column1Posters: column1Posters,
      baseOffset: _baseOffset,
      column3Posters: column3Posters,
      column2Posters: column2Posters,
      itemExtent: _itemExtent,
    ),
  );
}

class TabletPosterColumns extends StatelessWidget {
  const TabletPosterColumns({
    super.key,
    required this.column1Posters,
    required double baseOffset,
    required this.column3Posters,
    required this.column2Posters,
    required double itemExtent,
  }) : _baseOffset = baseOffset,
       _itemExtent = itemExtent;

  final List<String> column1Posters;
  final double _baseOffset;
  final List<String> column3Posters;
  final List<String> column2Posters;
  final double _itemExtent;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      // LEFT COLUMN - Slowest, highest start
      Expanded(
        child: InfiniteScrollingListView(
          posters: column1Posters,
          speed: 25, // Slowest for elegant feel
          initialScrollOffset: _baseOffset,
        ),
      ),
      Expanded(
        child: InfiniteScrollingListView(
          posters: column3Posters,
          speed: 20, // Slowest for elegant feel
          initialScrollOffset: _baseOffset,
        ),
      ),
      Expanded(
        child: InfiniteScrollingListView(
          posters: column2Posters,
          speed: 16, // Slowest for elegant feel
          initialScrollOffset: _baseOffset,
        ),
      ),
      Expanded(
        child: InfiniteScrollingListView(
          posters: column1Posters,
          speed: 20, // Slowest for elegant feel
          initialScrollOffset: _baseOffset,
        ),
      ),

      // MIDDLE COLUMN - Medium speed, golden ratio offset
      Expanded(
        child: InfiniteScrollingListView(
          posters: column2Posters,
          speed: 25, // Medium speed
          initialScrollOffset: _baseOffset + (_itemExtent * 3.5), // ~581px
        ),
      ),

      // RIGHT COLUMN - Fastest, lowest start
      Expanded(
        child: InfiniteScrollingListView(
          posters: column3Posters,
          speed: 16, // Fastest for dynamic feel
          initialScrollOffset: _baseOffset + (_itemExtent * 6.8), // ~1,128px
        ),
      ),
    ],
  );
}

class MobilePosterColumns extends StatelessWidget {
  const MobilePosterColumns({
    super.key,
    required this.column1Posters,
    required double baseOffset,
    required this.column3Posters,
    required this.column2Posters,
    required double itemExtent,
  }) : _baseOffset = baseOffset,
       _itemExtent = itemExtent;

  final List<String> column1Posters;
  final double _baseOffset;
  final List<String> column3Posters;
  final List<String> column2Posters;
  final double _itemExtent;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      // LEFT COLUMN - Slowest, highest start
      Expanded(
        child: InfiniteScrollingListView(
          posters: column1Posters,
          speed: 25, // Slowest for elegant feel
          initialScrollOffset: _baseOffset,
          itemExtent: _itemExtent,
        ),
      ),

      Expanded(
        child: InfiniteScrollingListView(
          posters: column2Posters,
          speed: 20, // Slowest for elegant feel
          initialScrollOffset: _baseOffset,
          itemExtent: _itemExtent,
        ),
      ),
      Expanded(
        child: InfiniteScrollingListView(
          posters: column3Posters,
          speed: 16, // Slowest for elegant feel
          initialScrollOffset: _baseOffset,
          itemExtent: _itemExtent,
        ),
      ),
    ],
  );
}
