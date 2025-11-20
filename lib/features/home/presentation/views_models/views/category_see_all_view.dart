import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/core/utils/pagination/cubit/category_pagination_cubit.dart';
import 'package:cinemax_app_new/core/utils/pagination/cubit/category_pagination_state.dart';
import 'package:cinemax_app_new/core/utils/size_config.dart';
import 'package:cinemax_app_new/hooks/ui/use_pagintation_controller_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CategorySeeAllView<
  C extends CategoryPaginationCubit<CAT, T, P>,
  CAT,
  T,
  P
>
    extends HookWidget {
  final CAT category;
  final String? title;
  final Widget Function(T item)? itemBuilder;
  final int crossAxisCount;
  final double childAspectRatio;
  final EdgeInsets? padding;
  final bool showAppBar;
  final P? params;
  const CategorySeeAllView({
    super.key,
    required this.category,
    this.title,
    this.itemBuilder,
    this.crossAxisCount = 2,
    this.childAspectRatio = 0.7,
    this.padding,
    this.showAppBar = true,
    this.params,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final scrollController = useScrollController();
    final paginationController = usePagintationControllerTest<C, CAT, P>(
      scrollController: scrollController,
      cubit: context.read<C>(),
      category: category,
      params: params as P,
    );
    return Scaffold(
      appBar: showAppBar
          ? AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_rounded),
              ),
              title: Text(
                title ?? 'See All',
                style: AppStyles.textStyle18(context),
              ),
              actions: [
                // Refresh button
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () {
                    context.read<C>().refreshCategory(category);
                  },
                ),
              ],
            )
          : null,
      body: BlocBuilder<C, CategoryPaginationState<CAT, T>>(
        buildWhen: (previous, current) {
          if (previous is CategoryPaginationLoaded<CAT, T> &&
              current is CategoryPaginationLoaded<CAT, T>) {
            return previous.getPaginationInfo(category) !=
                current.getPaginationInfo(category);
          }
          return true;
        },
        builder: (context, state) {
          if (state is CategoryPaginationInitial) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is! CategoryPaginationLoaded<CAT, T>) {
            return const Center(child: Text('Unknown state'));
          }

          final items = state.getItems(category);
          final isLoading = state.isLoading(category);
          final isInitialLoad = state.isInitialLoad(category);
          final canLoadMore = state.canLoadMore(category);
          final error = state.getError(category);

          // Initial loading
          if (isInitialLoad && isLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: AppPrimaryColors.blueAccent,
              ),
            );
          }

          // Error with no data
          if (error != null && items.isEmpty) {
            return _buildErrorData(error, context);
          }

          // Empty state
          if (items.isEmpty && !isLoading) {
            return _buildLoadingState();
          }

          // Grid with pagination
          return RefreshIndicator(
            onRefresh: () async {
              await context.read<C>().refreshCategory(category);
            },
            child: GridView.builder(
              controller: paginationController.scrollController,
              padding: padding ?? const EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: width > SizeConfig.mobile ? 4 : 3,
                childAspectRatio: width > SizeConfig.mobile ? 0.6 : 0.5,
                crossAxisSpacing: 10,
              ),
              itemCount: items.length + (canLoadMore || isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                // Loading indicator at end
                if (index == items.length) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: CircularProgressIndicator(
                        color: AppPrimaryColors.blueAccent,
                      ),
                    ),
                  );
                }

                final item = items[index];

                // Use custom builder or default
                if (itemBuilder != null) {
                  return itemBuilder!(item);
                }

                // Default fallback
                return Card(child: Center(child: Text('Item $index')));
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.movie_outlined,
            size: 80,
            color: Colors.grey.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'No items available',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorData(String error, BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 64, color: Colors.red),
          const SizedBox(height: 16),
          Text(
            error,
            style: const TextStyle(color: Colors.red),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
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
}
