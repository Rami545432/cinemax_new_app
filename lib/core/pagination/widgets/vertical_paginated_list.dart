// core/pagination/widgets/vertical_paginated_list.dart

import 'package:flutter/material.dart';
import 'package:movify/core/pagination/presentation/bloc/new_pagination_info.dart';
import 'package:movify/core/pagination/widgets/pagination_bottom_slot.dart';
import 'package:movify/core/pagination/widgets/pagination_error.dart';
import 'package:movify/core/pagination/widgets/pagination_shimmer.dart';

class VerticalPaginatedList<T> extends StatefulWidget {
  final PaginationInfo<T, dynamic> info;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final VoidCallback onScrollEnd;
  final VoidCallback onRetry;
  final double scrollThreshold;
  final EdgeInsets padding;
  final Widget? loadingWidget;
  final Widget? emptyWidget;
  final Widget Function(String message)? errorBuilder;
  final Widget? separator;
  final ScrollController? externalScrollController;

  const VerticalPaginatedList({
    super.key,
    required this.info,
    required this.itemBuilder,
    required this.onScrollEnd,
    required this.onRetry,
    this.scrollThreshold = 300,
    this.padding = const EdgeInsets.all(16),
    this.loadingWidget,
    this.emptyWidget,
    this.errorBuilder,
    this.separator,
    this.externalScrollController,
  });

  @override
  State<VerticalPaginatedList<T>> createState() =>
      _VerticalPaginatedListState<T>();
}

class _VerticalPaginatedListState<T> extends State<VerticalPaginatedList<T>> {
  @override
  Widget build(BuildContext context) => _buildContent();

  Widget _buildContent() {
    final info = widget.info;

    // ── First page loading ──────────────────────────────
    if (info.isFirstLoad) {
      return widget.loadingWidget ?? const PaginationShimmer();
    }

    // ── First page error ────────────────────────────────
    if (info.firstPageError != null && !info.hasData) {
      return widget.errorBuilder?.call(info.firstPageError!) ??
          PaginationErrorWidget(
            message: info.firstPageError!,
            onRetry: widget.onRetry,
          );
    }

    // ── Empty ───────────────────────────────────────────
    if (!info.hasData) {
      return widget.emptyWidget ??
          const Center(child: Text('Nothing here yet'));
    }

    // ── List ────────────────────────────────────────────
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollUpdateNotification) {
          final pos = notification.metrics;
          if (pos.pixels >= pos.maxScrollExtent - widget.scrollThreshold) {
            widget.onScrollEnd();
          }
        }
        return false;
      },
      child: ListView.separated(
        controller: widget.externalScrollController,
        padding: widget.padding,
        itemCount: info.items.length + 1,
        separatorBuilder: (context, index) =>
            widget.separator ?? const SizedBox(height: 12),
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
