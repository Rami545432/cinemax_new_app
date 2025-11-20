import 'package:cinemax_app_new/features/home/domian/uses_cases/fetch_popular_use_case.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/cubit_parameters/params.dart';
import '../../../../../core/utils/helper/base_pagination_cubit/base_paginated_cubit.dart';
import '../../../../../core/utils/helper/base_pagination_cubit/base_paginated_states.dart';
import '../../../../../models/base_card_model.dart';
import '../../../domian/entites/movie_entity.dart';

part 'fetch_popular_movies_state.dart';

class FetchPopularMoviesCubit
    extends BasePaginatedCubit<BaseCardModel, PopularParams> {
  final FetchPopularUseCase fetchPopularUseCase;

  FetchPopularMoviesCubit(this.fetchPopularUseCase)
    : super(
        BasePaginatedInitial<BaseCardModel>(),
        _createPageLoader(fetchPopularUseCase),
      );

  static PageLoader<BaseCardModel, PopularParams> _createPageLoader(
    FetchPopularUseCase useCase,
  ) {
    return ({
      required PopularParams params,
      int? page,
      CancelToken? cancelToken,
    }) async {
      final result = await useCase.call(params, page, cancelToken);
      return result;
    };
  }
}
