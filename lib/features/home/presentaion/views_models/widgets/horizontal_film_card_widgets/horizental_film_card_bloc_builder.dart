import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/helper/base_pagination_cubit/base_paginated_states.dart';
import '../../../../../../models/base_card_model.dart';
import '../../../manger/fetch_trending_movie_cubit/fetch_trending_movie_cubit.dart';
import 'horizontal_expandable_page_view.dart';

class HorizintalFilmCardBlocBuilder extends StatelessWidget {
  const HorizintalFilmCardBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      FetchTrendingMovieCubit,
      BasePaginatedStates<BaseCardModel>
    >(
      builder: (context, state) {
        if (state is BasePaginatedSuccess<BaseCardModel>) {
          return HorizontalExpandablePageView(data: state.newData);
        }
        if (state is BasePaginatedError<BaseCardModel>) {
          return Text(state.errorMessage);
        }
        if (state is BasePaginatedLoading<BaseCardModel>) {
          return HorizontalExpandablePageView(data: state.oldData);
        }
        if (state is BasePaginatedInitial<BaseCardModel>) {
          return const SizedBox.shrink();
        }
        return const SizedBox.shrink();
      },
    );
  }
}
