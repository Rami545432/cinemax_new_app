import 'package:cinemax_app_new/features/home/presentaion/views_models/widgets/sub_bar_and_main_card.dart';
import 'package:cinemax_app_new/features/series/presentaion/manger/fetch_popular_tv_shows_cubit/fetch_popular_tv_shows_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/helper/base_pagination_cubit/base_paginated_states.dart';
import '../../../../models/base_card_model.dart';

class TvPopularBlocBuilder extends StatelessWidget {
  const TvPopularBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      FetchPopularTvShowsCubit,
      BasePaginatedStates<BaseCardModel>
    >(
      builder: (context, state) {
        if (state is BasePaginatedSuccess<BaseCardModel>) {
          return SubBarAndMainCard(
            data: state.newData,
            title: 'Popular',
            type: 'tv',
            cubitType: context.read<FetchPopularTvShowsCubit>(),
          );
        }
        if (state is BasePaginatedError<BaseCardModel>) {
          return Text(state.errorMessage);
        }
        if (state is BasePaginatedLoading<BaseCardModel>) {
          return SubBarAndMainCard(
            data: state.oldData,
            title: 'Popular',
            type: 'tv',
            cubitType: context.read<FetchPopularTvShowsCubit>(),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
