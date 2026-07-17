// core/pagination/widgets/mixins/scroll_end_mixin.dart

import 'package:flutter/material.dart';

mixin ScrollEndMixin<T extends StatefulWidget> on State<T> {
  ScrollController? get externalScrollController;
  double get scrollThreshold;
  VoidCallback get onScrollEnd;

  late final ScrollController scrollController;
  late final bool _ownsController;

  void initScrollController() {
    _ownsController = externalScrollController == null;
    scrollController = externalScrollController ?? ScrollController();
    scrollController.addListener(_onScroll);
  }

  void disposeScrollController() {
    scrollController.removeListener(_onScroll);
    if (_ownsController) {
      scrollController.dispose();
    }
  }

  void _onScroll() {
    final pos = scrollController.position;
    if (pos.pixels >= pos.maxScrollExtent - scrollThreshold) {
      onScrollEnd();
    }
  }
}
