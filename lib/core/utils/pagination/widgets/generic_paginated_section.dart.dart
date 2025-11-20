import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:cinemax_app_new/core/utils/pagination/cubit/category_pagination_cubit.dart';
import 'package:cinemax_app_new/core/utils/pagination/cubit/category_pagination_state.dart';
import 'package:cinemax_app_new/core/utils/size_config.dart';
import 'package:cinemax_app_new/core/utils/skeletionzed_loading_cards/vertical_film_card_loading.dart';
import 'package:cinemax_app_new/features/home/presentation/views_models/widgets/section_header.dart';
import 'package:cinemax_app_new/hooks/ui/use_pagintation_controller_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class GenericPaginatedSection<
  C extends CategoryPaginationCubit<CAT, T, P>,
  CAT,
  T,
  P
>
    extends HookWidget {
  /// Category to display
  final CAT category;

  /// Section title
  final String title;

  /// Builder for individual items
  final Widget Function(T item) itemBuilder;

  /// Height of the horizontal list
  final double listHeight;

  /// Show section header
  final bool showHeader;

  /// Show "See All" button
  final bool showSeeAllButton;

  /// Callback when "See All" is pressed
  final VoidCallback? onSeeAll;

  /// Custom empty state widget
  final Widget Function(CAT category)? emptyStateBuilder;

  /// Custom error widget
  final Widget Function(CAT category, String error)? errorBuilder;

  /// Custom loading widget
  final Widget? loadingWidget;

  /// Show loading indicator at end of list when paginating
  final bool showPaginationLoader;

  /// Padding for the section
  final EdgeInsets? padding;

  /// Scroll direction
  final Axis scrollDirection;

  /// Item spacing
  final double itemSpacing;

  /// Parameters
  final P? params;

  const GenericPaginatedSection({
    super.key,
    required this.category,
    required this.title,
    required this.itemBuilder,
    this.listHeight = 250,
    this.showHeader = true,
    this.showSeeAllButton = false,
    this.onSeeAll,
    this.emptyStateBuilder,
    this.errorBuilder,
    this.loadingWidget,
    this.showPaginationLoader = true,
    this.padding,
    this.scrollDirection = Axis.horizontal,
    this.itemSpacing = 12,
    this.params,
  });

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final paginationController = usePagintationControllerTest<C, CAT, P>(
      scrollController: scrollController,
      cubit: context.read<C>(),
      category: category,
      params: params as P,
    );
    return BlocBuilder<C, CategoryPaginationState<CAT, T>>(
      buildWhen: (previous, current) {
        // Only rebuild if THIS category's data changed
        if (previous is CategoryPaginationLoaded<CAT, T> &&
            current is CategoryPaginationLoaded<CAT, T>) {
          return previous.getPaginationInfo(category) !=
              current.getPaginationInfo(category);
        }
        return true;
      },
      builder: (context, state) {
        if (state is! CategoryPaginationLoaded<CAT, T>) {
          return const SizedBox.shrink();
        }

        final items = state.getItems(category);
        final isLoading = state.isLoading(category);
        final isInitialLoad = state.isInitialLoad(category);
        final canLoadMore = state.canLoadMore(category);
        final error = state.getError(category);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            if (showHeader) _buildHeader(context),

            // Initial Loading State
            if (isInitialLoad && isLoading)
              _buildInitialLoading(
                context,
                isInitialLoad,
                isLoading,
                paginationController.scrollController,
                items,
              ),

            // Error State (with no data)
            if (error != null && items.isEmpty) _buildError(context, error),

            if (items.isNotEmpty)
              _buildItemsList(
                context,
                items,
                canLoadMore,
                isLoading,
                paginationController.scrollController,
              ),

            // Empty State
            if (items.isEmpty && !isLoading && error == null)
              _buildEmptyState(context),

            // See All Button
            if (showSeeAllButton && items.isNotEmpty)
              _buildSeeAllButton(context),
          ],
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SectionHeader<C, CAT, T, P>(
      category: category,
      title: title,
      itemBuilder: itemBuilder,
    );
  }

  Widget _buildInitialLoading(
    BuildContext context,
    bool isInitialLoad,
    bool isLoading,
    ScrollController scrollController,
    List<T> items,
  ) {
    final width = MediaQuery.sizeOf(context).width;
    return AspectRatio(
      aspectRatio: width > SizeConfig.mobile ? 3 : 1.45,
      child: ListView.separated(
        scrollDirection: scrollDirection,
        controller: scrollController,

        padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 20,
        separatorBuilder: (_, _) => SizedBox(width: 10),
        itemBuilder: (context, index) {
          return VerticalFilmCardLoading();
        },
      ),
    );
  }

  Widget _buildError(BuildContext context, String error) {
    if (errorBuilder != null) {
      return errorBuilder!(category, error);
    }

    return Padding(
      padding: padding ?? const EdgeInsets.all(16),
      child: Column(
        children: [
          Icon(Icons.error_outline, color: Colors.red, size: 48),
          const SizedBox(height: 8),
          Text(
            error,
            style: TextStyle(color: Colors.red),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              context.read<C>().loadCategory(category);
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildItemsList(
    BuildContext context,
    List<T> items,
    bool canLoadMore,
    bool isLoading,
    ScrollController scrollController,
  ) {
    final itemCount = items.length + (canLoadMore || isLoading ? 1 : 0);
    final width = MediaQuery.sizeOf(context).width;

    return AspectRatio(
      aspectRatio: width > SizeConfig.mobile ? 3 : 1.45,
      child: ListView.separated(
        controller: scrollController,
        scrollDirection: scrollDirection,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
        itemCount: itemCount,
        separatorBuilder: (_, _) => SizedBox(
          width: scrollDirection == Axis.horizontal ? itemSpacing : 0,
          height: scrollDirection == Axis.vertical ? itemSpacing : 0,
        ),
        itemBuilder: (context, index) {
          // Show loading indicator at end
          if (index == items.length) {
            if (!showPaginationLoader) return const SizedBox.shrink();

            return Container(
              width: scrollDirection == Axis.horizontal ? 60 : null,
              height: scrollDirection == Axis.vertical ? 60 : null,
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                color: AppPrimaryColors.blueAccent,
              ),
            );
          }

          return itemBuilder(items[index]);
        },
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    if (emptyStateBuilder != null) {
      return emptyStateBuilder!(category);
    }

    return Padding(
      padding: padding ?? const EdgeInsets.all(16),
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.movie_outlined,
              size: 64,
              color: Colors.grey.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 16),
            Text(
              'No items available',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSeeAllButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextButton(onPressed: onSeeAll, child: const Text('See All →')),
    );
  }
}
