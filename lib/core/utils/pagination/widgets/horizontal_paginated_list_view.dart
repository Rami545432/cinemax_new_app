import 'package:cinemax_app_new/core/utils/pagination/presentation/bloc/new_pagination_info.dart';
import 'package:cinemax_app_new/core/utils/pagination/widgets/pagination_bottom_slot.dart';
import 'package:cinemax_app_new/core/utils/pagination/widgets/pagination_error.dart';
import 'package:cinemax_app_new/core/utils/pagination/widgets/pagination_shimmer.dart';
import 'package:flutter/material.dart';

/// A fully generic horizontal paginated list.
/// Knows nothing about Blocs, Movies, News, or Products.
/// The parent extracts PaginationInfo from its bloc and passes it here.
///
/// Usage:
// ignore: unintended_html_in_doc_comment
/// HorizontalPaginatedList<MovieEntity>(
///   info: state.getPaginationInfo(category),
///   itemBuilder: (movie) => MovieCard(movie: movie),
///   onScrollEnd: () => bloc.add(LoadNextPageEvent(category)),
///   onRetry: () => bloc.add(LoadCategoryEvent(category)),
/// )
class HorizontalPaginatedList<T> extends StatefulWidget {
  /// The current pagination state for this slot
  final PaginationInfo<T, dynamic> info;

  /// How to render each item — widget knows nothing about T
  final Widget Function(BuildContext context, T item, bool enableHero)
  itemBuilder;

  /// Called when scroll position nears the end
  final VoidCallback onScrollEnd;

  /// Called when user taps retry on first page error
  final VoidCallback onRetry;

  /// Fixed height of the horizontal list area
  final double height;

  /// How far from end to trigger onScrollEnd (px)
  final double scrollThreshold;

  /// Padding around the list
  final EdgeInsets padding;

  /// Override the default shimmer
  final Widget? loadingWidget;

  /// Override the default error widget
  final Widget Function(String message)? errorBuilder;

  /// Override the default empty widget
  final Widget? emptyWidget;

  /// Gap between items
  final double itemGap;

  final bool enableHero;

  const HorizontalPaginatedList({
    super.key,
    required this.info,
    required this.itemBuilder,
    required this.onScrollEnd,
    required this.onRetry,
    this.height = 200,
    this.scrollThreshold = 200,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.loadingWidget,
    this.errorBuilder,
    this.emptyWidget,
    this.itemGap = 12,
    this.enableHero = true,
  });

  @override
  State<HorizontalPaginatedList<T>> createState() =>
      _HorizontalPaginatedListState<T>();
}

class _HorizontalPaginatedListState<T>
    extends State<HorizontalPaginatedList<T>> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    final pos = _scrollController.position;
    if (pos.pixels >= pos.maxScrollExtent - widget.scrollThreshold) {
      widget.onScrollEnd();
    }
  }

  @override
  Widget build(BuildContext context) =>
      SizedBox(height: widget.height, child: _buildContent());

  Widget _buildContent() {
    final info = widget.info;

    // ── First page loading ──────────────────────────────
    if (info.isFirstLoad) {
      return widget.loadingWidget ??
          PaginationShimmer(isHorizontal: true, height: widget.height);
    }

    // ── First page error ────────────────────────────────
    if (info.firstPageError != null && !info.hasData) {
      return widget.errorBuilder?.call(info.firstPageError!) ??
          PaginationErrorWidget(
            message: info.firstPageError!,
            onRetry: widget.onRetry,
            isCompact: true,
          );
    }

    // ── Empty ───────────────────────────────────────────
    if (!info.hasData) {
      return widget.emptyWidget ??
          const Center(child: Text('Nothing here yet'));
    }

    // ── List ────────────────────────────────────────────
    return ListView.builder(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      padding: widget.padding,
      // +1 for the end slot (loader / retry / nothing)
      itemCount: info.items.length + 1,
      itemBuilder: (context, index) {
        // End slot
        if (index == info.items.length) {
          return PaginationBottomSlot(
            isFetchingMore: info.isFetchingMore,
            fetchMoreError: info.fetchMoreError,
            hasMore: info.canLoadMore,
            isHorizontal: true,
            onRetry: widget.onRetry,
          );
        }

        return Padding(
          padding: EdgeInsets.only(right: widget.itemGap),
          child: widget.itemBuilder(
            context,
            info.items[index],
            widget.enableHero,
          ),
        );
      },
    );
  }
}
