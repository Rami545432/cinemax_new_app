// core/pagination/widgets/paginated_grid_view.dart

import 'package:cinemax_app_new/constant.dart';
import 'package:cinemax_app_new/core/utils/pagination/presentation/bloc/new_pagination_info.dart';
import 'package:cinemax_app_new/core/utils/pagination/widgets/mixins/scroll_end_mixin.dart';
import 'package:cinemax_app_new/core/utils/pagination/widgets/pagination_bottom_slot.dart';
import 'package:flutter/material.dart';

class SliverPaginatedGridView<T> extends StatefulWidget {
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

  const SliverPaginatedGridView({
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
  State<SliverPaginatedGridView<T>> createState() =>
      _PaginatedGridViewState<T>();
}

class _PaginatedGridViewState<T> extends State<SliverPaginatedGridView<T>>
    with ScrollEndMixin {
  @override
  ScrollController? get externalScrollController =>
      widget.externalScrollController;

  @override
  double get scrollThreshold => widget.scrollThreshold;

  @override
  VoidCallback get onScrollEnd => widget.onScrollEnd;
  @override
  void initState() {
    super.initState();
    initScrollController();
  }

  @override
  void dispose() {
    disposeScrollController();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _buildContent();

  Widget _buildContent() {
    final info = widget.info;
    final width = MediaQuery.sizeOf(context).width;

    if (info.isFirstLoad) {
      return SliverToBoxAdapter(
        child:
            widget.loadingWidget ??
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 60),
              child: Center(
                child: CircularProgressIndicator(color: Colors.blue),
              ),
            ),
      );
    }

    if (info.hasError && info.items.isEmpty) {
      return SliverToBoxAdapter(
        child:
            widget.errorBuilder?.call(info.firstPageError ?? 'Error') ??
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(info.firstPageError ?? 'Something went wrong'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: widget.onRetry,
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
      );
    }

    if (info.items.isEmpty && !info.isFetchingFirstPage) {
      return SliverToBoxAdapter(
        child:
            widget.emptyWidget ??
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 60),
              child: Center(child: Text('No results found')),
            ),
      );
    }

    return SliverPadding(
      padding: widget.padding,
      sliver: SliverGrid.builder(
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
