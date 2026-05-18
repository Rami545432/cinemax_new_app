import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/core/pagination/presentation/bloc/category_pagination_bloc.dart';
import 'package:movify/core/pagination/presentation/bloc/category_pagination_event.dart';
import 'package:movify/core/pagination/widgets/category_content_area.dart';

abstract class BaseBrowseView<
  B extends CategoryPaginationBloc<CAT, T, P>,
  CAT,
  T,
  P
>
    extends StatelessWidget {
  const BaseBrowseView({super.key});

  B createBloc(BuildContext context);

  Widget buildListItem(BuildContext context, T item);

  Widget buildGridItem(BuildContext context, T item);

  List<CAT> get categories;

  CAT get category;

  // ── Optional overrides ────────────────────────────────────────────

  String get screenTitle => 'Browse';

  SliverGridDelegate? get gridDelegate => null;
  List<Widget> buildActions(
    BuildContext context,
    B bloc,
    CAT selectedCategory,
  ) => const []; // default — no actions
  @override
  Widget build(BuildContext context) => BlocProvider<B>(
    create: (ctx) => createBloc(ctx),
    child: _BrowseShell<B, CAT, T, P>(
      screenTitle: screenTitle,
      categories: categories,
      initialCategory: category,
      listItemBuilder: buildListItem,
      gridItemBuilder: buildGridItem,
      gridDelegate: gridDelegate,
      buildActions: buildActions,
    ),
  );
}

class _BrowseShell<B extends CategoryPaginationBloc<CAT, T, P>, CAT, T, P>
    extends StatefulWidget {
  const _BrowseShell({
    super.key,
    required this.screenTitle,
    required this.categories,
    required this.initialCategory,
    required this.listItemBuilder,
    required this.gridItemBuilder,
    required this.gridDelegate,
    required this.buildActions,
  });

  final String screenTitle;
  final List<CAT> categories;
  final CAT initialCategory;
  final Widget Function(BuildContext context, T item) listItemBuilder;
  final Widget Function(BuildContext context, T item) gridItemBuilder;
  final SliverGridDelegate? gridDelegate;
  final List<Widget> Function(BuildContext, B, CAT) buildActions;
  @override
  State<_BrowseShell<B, CAT, T, P>> createState() =>
      _BrowseShellState<B, CAT, T, P>();
}

class _BrowseShellState<B extends CategoryPaginationBloc<CAT, T, P>, CAT, T, P>
    extends State<_BrowseShell<B, CAT, T, P>> {
  late CAT _selected;
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _selected = widget.initialCategory;
    context.read<B>().add(LoadCategoryEvent(_selected));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(widget.screenTitle),
      actions: [
        // ✅ passes selected category — no ancestor lookup needed
        ...widget.buildActions(context, context.read<B>(), _selected),
      ],
    ),
    body: Column(
      children: [
        Expanded(
          child: CategoryContentArea<CAT, T, P>(
            bloc: context.read<B>(),
            category: _selected,
            scrollController: _scrollController,
            listItemBuilder: widget.listItemBuilder,
            gridItemBuilder: widget.gridItemBuilder,
            gridDelegate: widget.gridDelegate,
          ),
        ),
      ],
    ),
  );
}
