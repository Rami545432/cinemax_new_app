import '../../../../features/home/presentaion/views_models/widgets/sub_bar_and_main_card.dart';
import '../manger/fetch_top_rated_tv_shows_cubit/fetch_top_rated_tv_shows_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/helper/base_pagination_cubit/base_paginated_states.dart';
import '../../../../models/base_card_model.dart';

class TopRatedTvShowsBlocBuilder extends StatelessWidget {
  const TopRatedTvShowsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      FetchTopRatedTvShowsCubit,
      BasePaginatedStates<BaseCardModel>
    >(
      builder: (context, state) {
        if (state is BasePaginatedSuccess<BaseCardModel>) {
          return SubBarAndMainCard(
            data: state.newData,
            title: 'Top Rated',
            type: 'tv',
            cubitType: context.read<FetchTopRatedTvShowsCubit>(),
          );
        }
        if (state is BasePaginatedError<BaseCardModel>) {
          return Text(state.errorMessage);
        }
        if (state is BasePaginatedLoading<BaseCardModel>) {
          return SubBarAndMainCard(
            data: state.oldData,
            title: 'Top Rated',
            type: 'tv',
            cubitType: context.read<FetchTopRatedTvShowsCubit>(),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
