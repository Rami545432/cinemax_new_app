import 'package:flutter/material.dart';

/// Generic animated list manager that can handle any type of item
class AnimatedListManager<T> {
  final GlobalKey _animatedKey;
  final List<T> _items;
  final Duration animationDuration;
  final Duration staggerDelay;
  final bool isGrid;

  AnimatedListManager({
    required GlobalKey animatedKey,
    required List<T> items,
    this.animationDuration = const Duration(milliseconds: 300),
    this.staggerDelay = const Duration(milliseconds: 100),
    this.isGrid = false,
  }) : _animatedKey = animatedKey,
       _items = items;

  /// Remove a single item with animation
  void removeItem(
    int index,
    Widget Function(T item, Animation<double> animation) removedItemBuilder,
    VoidCallback? onRemoved,
  ) {
    if (index < 0 || index >= _items.length) return;

    final removedItem = _items[index];
    _items.removeAt(index);

    if (isGrid) {
      (_animatedKey.currentState as SliverAnimatedGridState).removeItem(
        index,
        (context, animation) => removedItemBuilder(removedItem, animation),
        duration: animationDuration,
      );
    } else {
      (_animatedKey.currentState as SliverAnimatedListState).removeItem(
        index,
        (context, animation) => removedItemBuilder(removedItem, animation),
        duration: animationDuration,
      );
    }
    onRemoved?.call();
  }

  /// Remove all items with staggered animation
  void removeAllItems(
    Widget Function(T item, Animation<double> animation) removedItemBuilder,
    VoidCallback? onAllRemoved,
  ) {
    if (_items.isEmpty) {
      onAllRemoved?.call();
      return;
    }

    for (int i = _items.length - 1; i >= 0; i--) {
      final removedItem = _items[i];
      final delay = Duration(
        milliseconds: ((_items.length - 1 - i) * staggerDelay.inMilliseconds),
      );

      Future.delayed(delay, () {
        if (_animatedKey.currentState != null) {
          _items.removeAt(i);
          if (isGrid) {
            (_animatedKey.currentState as SliverAnimatedGridState).removeItem(
              i,
              (context, animation) =>
                  removedItemBuilder(removedItem, animation),
              duration: animationDuration,
            );
          } else {
            (_animatedKey.currentState as SliverAnimatedListState).removeItem(
              i,
              (context, animation) =>
                  removedItemBuilder(removedItem, animation),
              duration: animationDuration,
            );
          }
        }
      });
    }

    Future.delayed(
      Duration(milliseconds: staggerDelay.inMilliseconds * 2),
      onAllRemoved,
    );
  }

  /// Add item with animation
  void addItem(T item, int index) {
    _items.insert(index, item);
    if (isGrid) {
      (_animatedKey.currentState as SliverAnimatedGridState).insertItem(
        index,
        duration: animationDuration,
      );
    } else {
      (_animatedKey.currentState as SliverAnimatedListState).insertItem(
        index,
        duration: animationDuration,
      );
    }
  }
}
