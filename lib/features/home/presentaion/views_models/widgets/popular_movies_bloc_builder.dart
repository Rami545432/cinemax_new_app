import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/helper/base_pagination_cubit/base_paginated_states.dart';
import '../../../../../models/base_card_model.dart';
import '../../manger/fetch_popular_movie_cubit/fetch_popular_movies_cubit.dart';

import 'sub_bar_and_main_card.dart';

class PopularMoviesBlocBuilder extends StatelessWidget {
  const PopularMoviesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      FetchPopularMoviesCubit,
      BasePaginatedStates<BaseCardModel>
    >(
      builder: (context, state) {
        if (state is BasePaginatedSuccess<BaseCardModel>) {
          return SubBarAndMainCard(
            data: state.newData,
            title: 'POPULAR',
            type: 'movie',
            cubitType: context.read<FetchPopularMoviesCubit>(),
          );
        }
        if (state is BasePaginatedError<BaseCardModel>) {
          return Text(state.errorMessage);
        }
        if (state is BasePaginatedLoading<BaseCardModel>) {
          return SubBarAndMainCard(
            data: state.oldData,
            title: 'POPULAR',
            type: 'movie',
            cubitType: context.read<FetchPopularMoviesCubit>(),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
