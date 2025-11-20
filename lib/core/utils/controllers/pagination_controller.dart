import 'dart:async';

import 'package:cinemax_app_new/core/utils/helper/base_pagination_cubit/base_paginated_cubit.dart';
import 'package:flutter/material.dart';

class PaginationController<Cubit extends BasePaginatedCubit> {
  final Cubit cubit;
  final ScrollController scrollController;
  Timer? _debounce;
  bool _disposed = false;
  PaginationController({required this.cubit, required this.scrollController}) {
    scrollController.addListener(onScroll);
  }

  void onScroll() {
    if (_disposed) return;
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(Durations.medium2, () {
      if (_disposed ||
          !scrollController.hasClients ||
          scrollController.positions.isEmpty) {
        return;
      }

      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent * 0.7) {
        if (!cubit.isFetching) {
          cubit.fetchNextPage();
        }
      }
    });
  }

  void dispose() {
    _disposed = true;
    scrollController.removeListener(onScroll);
    _debounce?.cancel();
  }
}
