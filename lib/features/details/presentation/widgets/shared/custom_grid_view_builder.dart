import 'dart:async';
import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:cinemax_app_new/core/utils/pagination/cubit/category_pagination_cubit.dart';
import 'package:cinemax_app_new/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomGridView<C extends CategoryPaginationCubit<CAT, T, P>, CAT, T, P>
    extends HookWidget {
  const CustomGridView({
    super.key,
    required this.data,
    required this.category,
    required this.params,
    required this.itemBuilder,
    this.showPaginationLoader = true,
    this.isLoading = false,
    this.canLoadMore = false,
  });

  final List<T> data;
  final CAT category;
  final P params;
  final Widget Function(T item) itemBuilder;
  final bool showPaginationLoader;
  final bool isLoading;
  final bool canLoadMore;

  @override
  Widget build(BuildContext context) {
    final itemCount = data.length + (canLoadMore || isLoading ? 1 : 0);
    final cubit = context.read<C>();
    final debounceTimer = useRef<Timer?>(null);

    useEffect(() {
      return () {
        debounceTimer.value?.cancel();
      };
    }, []);

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollUpdateNotification) {
          final metrics = notification.metrics;
          if (metrics.pixels >= metrics.maxScrollExtent * 0.9) {
            if (debounceTimer.value?.isActive ?? false) {
              debounceTimer.value?.cancel();
            }
            debounceTimer.value = Timer(Durations.medium2, () {
              if (canLoadMore && !isLoading) {
                cubit.loadNextPage(category);
              }
            });
          }
        }
        return false; // Allow notification to continue bubbling
      },
      child: GridView.builder(
        itemCount: itemCount,

        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          if (index == data.length) {
            if (!showPaginationLoader) return const SizedBox.shrink();
            return Container(
              width: 60,
              height: 60,
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                color: AppPrimaryColors.blueAccent,
              ),
            );
          }
          return itemBuilder(data[index]);
        },
        gridDelegate: customSilverGridDelegate(context),
      ),
    );
  }

  SliverGridDelegateWithFixedCrossAxisCount customSilverGridDelegate(
    BuildContext context,
  ) {
    final width = MediaQuery.sizeOf(context).width;
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: width > SizeConfig.mobile ? 4 : 3,
      childAspectRatio: width > SizeConfig.mobile ? 0.6 : 0.5,
      crossAxisSpacing: width > SizeConfig.mobile ? 30 : 20,
    );
  }
}
