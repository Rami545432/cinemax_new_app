import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../core/utils/helper/base_pagination_cubit/base_paginated_cubit.dart';

class UsePaginationController<Cubit extends BasePaginatedCubit> {
  final ScrollController scrollController;

  final Cubit cubit;

  UsePaginationController({
    required this.scrollController,
    required this.cubit,
  });
}

UsePaginationController usePaginationController<
  Cubit extends BasePaginatedCubit
>({required ScrollController scrollController, required Cubit cubit}) {
  final debounceTimer = useRef<Timer?>(null);

  useEffect(() {
    void updateScroll() {
      if (debounceTimer.value?.isActive ?? false) debounceTimer.value?.cancel();
      debounceTimer.value = Timer(Durations.medium2, () {
        if (!scrollController.hasClients) return;
        if (scrollController.positions.isEmpty) return;

        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent * 0.7) {
          if (!cubit.isFetching) {
            cubit.fetchNextPage();
          }
        }
      });
    }

    scrollController.addListener(updateScroll);

    return () {
      debounceTimer.value?.cancel();
      scrollController.removeListener(updateScroll);
    };
  }, [scrollController, cubit]);
  return UsePaginationController(
    scrollController: scrollController,
    cubit: cubit,
  );
}
