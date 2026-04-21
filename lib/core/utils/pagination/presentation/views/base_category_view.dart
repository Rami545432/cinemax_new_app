import 'package:cinemax_app_new/core/utils/pagination/presentation/bloc/category_pagination_bloc.dart';
import 'package:cinemax_app_new/core/utils/pagination/widgets/category_content_area.dart';
import 'package:cinemax_app_new/core/utils/pagination/widgets/view_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCategoryView<
  B extends CategoryPaginationBloc<CAT, T, P>,
  CAT,
  T,
  P
>
    extends StatelessWidget {
  final CAT initialCategory;

  const BaseCategoryView({super.key, required this.initialCategory});

  // ── Contract — feature implements these three only ────────────────

  /// Create the feature-specific bloc
  B createBloc(BuildContext context);

  /// How to render one item in list mode
  Widget buildListItem(BuildContext context, T item);

  /// How to render one item in grid mode
  Widget buildGridItem(BuildContext context, T item);

  // ── Optional overrides ────────────────────────────────────────────

  String screenTitle(BuildContext context) => initialCategory.toString();

  SliverGridDelegate? get gridDelegate => null;

  ViewMode get initialViewMode => ViewMode.grid;

  // ── Built once, shared by all features ───────────────────────────

  @override
  Widget build(BuildContext context) => BlocProvider<B>.value(
    value: createBloc(context),
    child: Builder(
      builder: (ctx) => Scaffold(
        body: _CategoryScreenShell<B, CAT, T, P>(
          screenTitle: screenTitle(ctx),
          initialCategory: initialCategory,
          listItemBuilder: buildListItem,
          gridItemBuilder: buildGridItem,
          gridDelegate: gridDelegate,
          initialViewMode: initialViewMode,
        ),
      ),
    ),
  );
}

class _CategoryScreenShell<
  B extends CategoryPaginationBloc<CAT, T, P>,
  CAT,
  T,
  P
>
    extends StatefulWidget {
  final String screenTitle;
  final CAT initialCategory;
  final Widget Function(BuildContext, T) listItemBuilder;
  final Widget Function(BuildContext, T) gridItemBuilder;
  final SliverGridDelegate? gridDelegate;
  final ViewMode initialViewMode;

  const _CategoryScreenShell({
    required this.screenTitle,
    required this.initialCategory,
    required this.listItemBuilder,
    required this.gridItemBuilder,
    this.gridDelegate,
    this.initialViewMode = ViewMode.grid,
  });

  @override
  State<_CategoryScreenShell<B, CAT, T, P>> createState() =>
      _CategoryScreenShellState<B, CAT, T, P>();
}

class _CategoryScreenShellState<
  B extends CategoryPaginationBloc<CAT, T, P>,
  CAT,
  T,
  P
>
    extends State<_CategoryScreenShell<B, CAT, T, P>> {
  // ✅ Owned here — passed down — no GlobalKey
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(widget.screenTitle)),
    body: CategoryContentArea<CAT, T, P>(
      bloc: context.read<B>(),
      category: widget.initialCategory,
      listItemBuilder: widget.listItemBuilder,
      gridItemBuilder: widget.gridItemBuilder,
      gridDelegate: widget.gridDelegate,
      initialViewMode: widget.initialViewMode,
      // ✅ passed down directly
      scrollController: _scrollController,
    ),
  );
}
