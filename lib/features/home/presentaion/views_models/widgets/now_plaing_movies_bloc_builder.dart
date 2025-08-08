import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/helper/base_pagination_cubit/base_paginated_states.dart';
import '../../../../../models/base_card_model.dart';
import '../../manger/fetch_now_playing_movie_cubit/fetch_now_playing_movies_cubit.dart';

import 'sub_bar_and_main_card.dart';

class NowPlayingMoviesBlocBuilder extends StatelessWidget {
  const NowPlayingMoviesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      FetchNowPlayingMoviesCubit,
      BasePaginatedStates<BaseCardModel>
    >(
      builder: (context, state) {
        if (state is BasePaginatedSuccess<BaseCardModel>) {
          return SubBarAndMainCard(
            data: state.newData,
            title: 'NOW PLAYING',
            type: 'movie',
            cubitType: context.read<FetchNowPlayingMoviesCubit>(),
          );
        }
        if (state is BasePaginatedError<BaseCardModel>) {
          return Text(state.errorMessage);
        }
        if (state is BasePaginatedLoading<BaseCardModel>) {
          return SubBarAndMainCard(
            data: state.oldData,
            title: 'NOW PLAYING',
            type: 'movie',
            cubitType: context.read<FetchNowPlayingMoviesCubit>(),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
