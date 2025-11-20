import 'package:cinemax_app_new/features/home/data/models/see_all_arguments_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../../core/network/presentation/cubit/connectivity_cubit.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/helper/base_pagination_cubit/base_paginated_cubit.dart';
import '../../../../../../core/utils/retry_button.dart';

import 'custom_sliver_app_bar.dart';
import 'custom_sliver_grid_builder.dart';

class SeeAllCustomScrollView extends HookWidget {
  const SeeAllCustomScrollView({
    super.key,
    required this.seeAllArgumentsModel,
    required this.scrollController,
    required this.cubit,
    required this.isLoadingMore,
  });

  final SeeAllArgumentsModel seeAllArgumentsModel;
  final ScrollController scrollController;
  final BasePaginatedCubit cubit;
  final bool isLoadingMore;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          CustomSliverAppBar(seeAllArgumentsModel: seeAllArgumentsModel),
          SliverPadding(
            padding: EdgeInsets.only(top: 16),
            sliver: CustomSliverGridViewBuilder(),
          ),
          SliverToBoxAdapter(
            child: Builder(
              builder: (context) {
                final connectivityCubit = context.read<ConnectivityCubit>();
                if (connectivityCubit.isOffline) {
                  return RetryButton(
                    onRetry: () {
                      cubit.fetchNextPage();
                    },
                  );
                }
                return isLoadingMore
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppPrimaryColors.blueAccent,
                        ),
                      )
                    : const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
