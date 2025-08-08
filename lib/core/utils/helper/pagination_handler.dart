import 'package:flutter/material.dart';
import 'dart:async';

import 'pagination_cubit.dart';

class PaginationHandler<Cubit extends PaginationCubit> {
  final Cubit cubit;
  final ScrollController scrollController;
  final String? type;
  final String? title;
  int nextPage = 2;
  bool isLoading = false;
  Timer? _debounce;

  PaginationHandler({
    required this.cubit,
    required this.scrollController,
    this.type,
    this.title,
  }) {
    scrollController.addListener(onScroll);
  }

  void onScroll() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(Durations.medium2, () {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent * 0.7) {
        if (!isLoading) {
          isLoading = true;
          _loadMoreData();
        }
      }
    });
  }

  Future<void> _loadMoreData() async {
    try {
      await cubit.fetchSeeAllData(
        title: title ?? "",
        type: type ?? '',
        page: nextPage,
      );
      await cubit.fetchData(page: nextPage, generId: '');
      nextPage++;
    } finally {
      isLoading = false;
    }
  }

  void dispose() {
    _debounce?.cancel();
    scrollController.dispose();
  }
}
