import 'dart:async';

import 'package:cinemax_app_new/core/utils/pagination/cubit/category_pagination_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UsePagintationControllerTest<C extends CategoryPaginationCubit, CAT> {
  final ScrollController scrollController;

  final C cubit;
  final CAT category;

  UsePagintationControllerTest({
    required this.scrollController,
    required this.cubit,
    required this.category,
  });
}

UsePagintationControllerTest
usePagintationControllerTest<Cubit extends CategoryPaginationCubit, CAT>({
  required ScrollController scrollController,
  required Cubit cubit,
  required CAT category,
}) {
  final debounceTimer = useRef<Timer?>(null);

  useEffect(() {
    void updateScroll() {
      if (debounceTimer.value?.isActive ?? false) debounceTimer.value?.cancel();
      debounceTimer.value = Timer(Durations.medium2, () {
        if (!scrollController.hasClients) return;
        if (scrollController.positions.isEmpty) return;

        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent * 0.9) {
          cubit.loadNextPage(category);
        }
      });
    }

    scrollController.addListener(updateScroll);

    return () {
      debounceTimer.value?.cancel();
      scrollController.removeListener(updateScroll);
    };
  }, [scrollController, cubit, category]);
  return UsePagintationControllerTest(
    scrollController: scrollController,
    cubit: cubit,
    category: category,
  );
}
