import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/helper/base_pagination_cubit/base_paginated_states.dart';
import '../../../../../models/base_card_model.dart';
import '../../manger/fetch_newst_movies_cubit/fetch_upcoming_movies_cubit.dart';

import 'sub_bar_and_main_card.dart';

class UpcomingMoviesBlocBuilder extends StatelessWidget {
  const UpcomingMoviesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      FetchUpcomingMoviesCubit,
      BasePaginatedStates<BaseCardModel>
    >(
      builder: (context, state) {
        if (state is BasePaginatedSuccess<BaseCardModel>) {
          return SubBarAndMainCard(
            data: state.newData,
            title: 'UPCOMING',
            type: 'movie',
            cubitType: context.read<FetchUpcomingMoviesCubit>(),
          );
        }
        if (state is BasePaginatedError<BaseCardModel>) {
          return Text(state.errorMessage);
        }
        if (state is BasePaginatedLoading<BaseCardModel>) {
          return SubBarAndMainCard(
            data: state.oldData,
            title: 'UPCOMING',
            type: 'movie',
            cubitType: context.read<FetchUpcomingMoviesCubit>(),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
