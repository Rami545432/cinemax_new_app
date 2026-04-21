import 'package:cinemax_app_new/config/animations/widgets/animated_list_item.dart';
import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:cinemax_app_new/core/utils/pagination/presentation/cubit/category_pagination_cubit.dart';
import 'package:cinemax_app_new/shared/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';

class CustomSliverGridViewBuilder<
  C extends CategoryPaginationCubit<CAT, T, P>,
  CAT,
  T,
  P
>
    extends StatelessWidget {
  const CustomSliverGridViewBuilder({
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

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverGrid.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          if (index == data.length) {
            if (!showPaginationLoader) {
              return const SizedBox.shrink();
            }
            return Center(
              child: CircularProgressIndicator(
                color: AppPrimaryColors.blueAccent,
              ),
            );
          }
          return AnimatedListItem(
            index: index % 10,
            child: itemBuilder(data[index]),
          );
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
