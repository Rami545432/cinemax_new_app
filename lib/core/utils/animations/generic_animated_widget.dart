import 'package:cinemax_app_new/features/search/presentaion/view_models/widgets/custom_grid_config.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/animations/remove_animation_builder.dart';
import '../../types/ui_types.dart';
import 'animated_list_manger.dart';
import 'build_animated_list_item.dart';

enum GenericAnimatedWidgetType { list, grid }

class GenericAnimatedWidget<T> extends StatefulWidget {
  final List<T> items;
  final ItemBuilder<T> itemBuilder;
  final void Function(T item) onItemRemoved;
  final void Function()? onAllItemsRemoved;
  final ListItemAnimationType? animationType;
  final RemoveAnimationType? removeAnimationType;
  final HeaderBuilder? headerWidget;
  final GenericAnimatedWidgetType widgetType;
  const GenericAnimatedWidget({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.onItemRemoved,
    this.onAllItemsRemoved,
    this.animationType = ListItemAnimationType.slideFromLeft,
    this.removeAnimationType = RemoveAnimationType.slideDown,
    this.headerWidget,
    this.widgetType = GenericAnimatedWidgetType.list,
  });

  @override
  State<GenericAnimatedWidget<T>> createState() =>
      _GenericAnimatedWidgetState<T>();
}

class _GenericAnimatedWidgetState<T> extends State<GenericAnimatedWidget<T>> {
  late GlobalKey _animatedKey;
  late List<T> _items;
  late AnimatedListManager<T> _animationManager;

  @override
  void initState() {
    super.initState();
    _items = List.from(widget.items);
    final isGrid = widget.widgetType == GenericAnimatedWidgetType.grid;
    _animatedKey = isGrid
        ? GlobalKey<SliverAnimatedGridState>()
        : GlobalKey<SliverAnimatedListState>();
    _animationManager = AnimatedListManager<T>(
      animatedKey: _animatedKey,
      items: _items,
      isGrid: isGrid,
    );
  }

  @override
  void didUpdateWidget(GenericAnimatedWidget<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.items != oldWidget.items) {
      _items = List.from(widget.items);
      final isGrid = widget.widgetType == GenericAnimatedWidgetType.grid;

      _animatedKey = isGrid
          ? GlobalKey<SliverAnimatedGridState>()
          : GlobalKey<SliverAnimatedListState>();

      _animationManager = AnimatedListManager<T>(
        animatedKey: _animatedKey,
        items: _items,
        isGrid: isGrid,
      );

      setState(() {});
    }
  }

  void _removeItem(int index) {
    final item = _items[index];
    _animationManager.removeItem(index, _buildRemovedItem, () {
      Future.delayed(const Duration(milliseconds: 300), () {
        widget.onItemRemoved(item);
      });
    });
  }

  void _removeAllItems() {
    _animationManager.removeAllItems(_buildRemovedItem, () {
      Future.delayed(const Duration(milliseconds: 200), () {
        widget.onAllItemsRemoved?.call();
      });
    });
  }

  Widget _buildRemovedItem(T item, Animation<double> animation) {
    return RemoveAnimationBuilder(
      animation: animation,
      animationType:
          widget.removeAnimationType ?? RemoveAnimationType.slideDown,
      child: widget.itemBuilder(item, () {}),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        if (widget.headerWidget != null)
          SliverToBoxAdapter(
            child: widget.headerWidget!(() => _removeAllItems()),
          ),
        _buildAnimatedSliver(),
      ],
    );
  }

  Widget _buildAnimatedSliver() {
    switch (widget.widgetType) {
      case GenericAnimatedWidgetType.list:
        return SliverAnimatedList(
          key: _animatedKey,
          initialItemCount: _items.length,
          itemBuilder: (context, index, animation) {
            if (index >= _items.length) return const SizedBox.shrink();
            final item = _items[index];
            return widget.itemBuilder(item, () => _removeItem(index));
          },
        );
      case GenericAnimatedWidgetType.grid:
        return SliverAnimatedGrid(
          key: _animatedKey,
          gridDelegate: CustomGridConfig.getDelegate(context),
          initialItemCount: _items.length,
          itemBuilder: (context, index, animation) {
            if (index >= _items.length) return const SizedBox.shrink();
            final item = _items[index];
            return widget.itemBuilder(item, () => _removeItem(index));
          },
        );
    }
  }
}
