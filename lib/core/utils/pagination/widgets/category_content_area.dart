// core/pagination/widgets/category_content_area.dart

import 'package:cinemax_app_new/core/utils/pagination/presentation/bloc/category_pagination_bloc.dart';
import 'package:cinemax_app_new/core/utils/pagination/presentation/bloc/category_pagination_event.dart';
import 'package:cinemax_app_new/core/utils/pagination/presentation/bloc/category_pagination_state.dart';
import 'package:cinemax_app_new/core/utils/pagination/presentation/bloc/new_pagination_info.dart';
import 'package:cinemax_app_new/core/utils/pagination/widgets/paginated_grid_view.dart';
import 'package:cinemax_app_new/core/utils/pagination/widgets/vertical_paginated_list.dart';
import 'package:cinemax_app_new/core/utils/pagination/widgets/view_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryContentArea<CAT, T, P> extends StatefulWidget {
  final CategoryPaginationBloc<CAT, T, P> bloc;
  final CAT category;

  /// How to render one item in list mode
  final Widget Function(BuildContext context, T item) listItemBuilder;

  /// How to render one item in grid mode
  final Widget Function(BuildContext context, T item) gridItemBuilder;

  /// Optional grid delegate override
  final SliverGridDelegate? gridDelegate;

  /// Optional initial view mode
  final ViewMode initialViewMode;
  final ScrollController scrollController;

  const CategoryContentArea({
    super.key,
    required this.bloc,
    required this.category,
    required this.listItemBuilder,
    required this.gridItemBuilder,
    this.gridDelegate,
    this.initialViewMode = ViewMode.grid,
    required this.scrollController,
  });

  @override
  State<CategoryContentArea<CAT, T, P>> createState() =>
      CategoryContentAreaState<CAT, T, P>();
}

class CategoryContentAreaState<CAT, T, P>
    extends State<CategoryContentArea<CAT, T, P>> {
  late ViewMode _viewMode;

  @override
  void initState() {
    super.initState();
    _viewMode = widget.initialViewMode;
  }

  /// Called externally by BrowseScreen on chip change
  void resetScroll() => widget.scrollController.jumpTo(0);

  @override
  Widget build(BuildContext context) => Column(
    children: [
      // ── Toggle bar ───────────────────────────────────
      Align(
        alignment: Alignment.centerRight,
        child: ViewToggle(
          mode: _viewMode,
          onToggle: (mode) => setState(() => _viewMode = mode),
        ),
      ),
      // ── Content ──────────────────────────────────────
      Expanded(
        child:
            BlocBuilder<
              CategoryPaginationBloc<CAT, T, P>,
              CategoryPaginationState<CAT, T, P>
            >(
              bloc: widget.bloc,
              // Only rebuild when this category slot changes
              buildWhen: (prev, curr) {
                if (prev is! CategoryPaginationLoaded<CAT, T, P> ||
                    curr is! CategoryPaginationLoaded<CAT, T, P>) {
                  return true;
                }
                return prev.getPaginationInfo(widget.category) !=
                    curr.getPaginationInfo(widget.category);
              },
              builder: (context, state) {
                final info = state is CategoryPaginationLoaded<CAT, T, P>
                    ? state.getPaginationInfo(widget.category)
                    : PaginationInfo<T, P>();

                return RefreshIndicator(
                  onRefresh: () => _onRefresh(),
                  child: _viewMode == ViewMode.list
                      ? VerticalPaginatedList<T>(
                          info: info,
                          itemBuilder: widget.listItemBuilder,
                          onScrollEnd: () => widget.bloc.add(
                            LoadNextPageEvent(widget.category),
                          ),
                          onRetry: () => widget.bloc.add(
                            LoadCategoryEvent(widget.category),
                          ),
                          externalScrollController: widget.scrollController,
                        )
                      : PaginatedGridView<T>(
                          info: info,
                          itemBuilder: widget.gridItemBuilder,
                          onScrollEnd: () => widget.bloc.add(
                            LoadNextPageEvent(widget.category),
                          ),
                          onRetry: () => widget.bloc.add(
                            LoadCategoryEvent(widget.category),
                          ),

                          externalScrollController: widget.scrollController,
                        ),
                );
              },
            ),
      ),
    ],
  );

  Future<void> _onRefresh() async {
    widget.bloc.add(LoadCategoryEvent(widget.category, forceRefresh: true));
    await widget.bloc.stream.firstWhere(
      (state) =>
          state is CategoryPaginationLoaded<CAT, T, P> &&
          !state.getPaginationInfo(widget.category).isFetchingFirstPage,
    );
  }
}
