// core/pagination/widgets/paginated_grid_view.dart

import 'package:flutter/material.dart';
import 'package:movify/constant.dart';
import 'package:movify/core/pagination/presentation/bloc/new_pagination_info.dart';
import 'package:movify/core/pagination/widgets/pagination_bottom_slot.dart';
import 'package:movify/core/pagination/widgets/pagination_error.dart';
import 'package:movify/core/pagination/widgets/pagination_shimmer.dart';

class PaginatedGridView<T> extends StatefulWidget {
  final PaginationInfo<T, dynamic> info;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final VoidCallback onScrollEnd;
  final VoidCallback onRetry;
  final SliverGridDelegate gridDelegate;
  final double scrollThreshold;
  final EdgeInsets padding;
  final Widget? loadingWidget;
  final Widget? emptyWidget;
  final Widget Function(String message)? errorBuilder;
  final ScrollController? externalScrollController;

  const PaginatedGridView({
    super.key,
    required this.info,
    required this.itemBuilder,
    required this.onScrollEnd,
    required this.onRetry,
    this.gridDelegate = const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 0.65,
    ),
    this.scrollThreshold = 300,
    this.padding = const EdgeInsets.all(16),
    this.loadingWidget,
    this.emptyWidget,
    this.errorBuilder,
    this.externalScrollController,
  });

  @override
  State<PaginatedGridView<T>> createState() => _PaginatedGridViewState<T>();
}

class _PaginatedGridViewState<T> extends State<PaginatedGridView<T>> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.widthOf(context);
    final info = widget.info;

    if (info.isFirstLoad) {
      return widget.loadingWidget ?? const PaginationShimmer();
    }

    if (info.firstPageError != null && !info.hasData) {
      return widget.errorBuilder?.call(info.firstPageError!) ??
          PaginationErrorWidget(
            message: info.firstPageError!,
            onRetry: widget.onRetry,
          );
    }

    if (!info.hasData) {
      return widget.emptyWidget ??
          const Center(child: Text('Nothing here yet'));
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        // Trigger pagination when reaching the end
        if (notification is ScrollUpdateNotification) {
          final pos = notification.metrics;
          if (pos.pixels >= pos.maxScrollExtent - widget.scrollThreshold) {
            widget.onScrollEnd();
          }
        }
        // Return false to let the notification bubble up (vital for NestedScrollView)
        return false;
      },
      child: GridView.builder(
        controller: widget.externalScrollController,
        padding: widget.padding,

        gridDelegate: Constants.sliverGridDelegate(width),
        // +1 for end slot — spans full width via SliverGridDelegate trick
        itemCount: info.items.length + 1,
        itemBuilder: (context, index) {
          if (index == info.items.length) {
            return PaginationBottomSlot(
              isFetchingMore: info.isFetchingMore,
              fetchMoreError: info.fetchMoreError,
              hasMore: info.canLoadMore,
              onRetry: widget.onRetry,
            );
          }
          return widget.itemBuilder(context, info.items[index]);
        },
      ),
    );
  }
}
