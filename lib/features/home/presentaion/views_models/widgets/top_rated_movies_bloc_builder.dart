import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/helper/base_pagination_cubit/base_paginated_states.dart';
import '../../../../../models/base_card_model.dart';
import '../../manger/fetch_top_rated_movies_cubit/fetch_top_rated_movies_cubit.dart';
import 'sub_bar_and_main_card.dart';

class TopRatedMoviesBlocBuilder extends StatelessWidget {
  const TopRatedMoviesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      FetchTopRatedMoviesCubit,
      BasePaginatedStates<BaseCardModel>
    >(
      builder: (context, state) {
        if (state is BasePaginatedSuccess<BaseCardModel>) {
          return SubBarAndMainCard(
            data: state.newData,
            title: 'TOP RATED',
            type: 'movie',
            cubitType: context.read<FetchTopRatedMoviesCubit>(),
          );
        }
        if (state is BasePaginatedError<BaseCardModel>) {
          return Text(state.errorMessage);
        }
        if (state is BasePaginatedLoading<BaseCardModel>) {
          return SubBarAndMainCard(
            data: state.oldData,
            title: 'TOP RATED',
            type: 'movie',
            cubitType: context.read<FetchTopRatedMoviesCubit>(),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
