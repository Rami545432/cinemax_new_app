import 'package:dio/dio.dart';

import '../../../../../core/utils/cubit_parameters/params.dart';
import '../../../../../core/utils/helper/base_pagination_cubit/base_paginated_cubit.dart';
import '../../../../../core/utils/helper/base_pagination_cubit/base_paginated_states.dart';
import '../../../../../models/base_card_model.dart';
import '../../../domian/uses_cases/fetch_trending_movie_use_case.dart';

class FetchTrendingMovieCubit
    extends BasePaginatedCubit<BaseCardModel, TrendingParams> {
  FetchTrendingMovieCubit(this.fetchTrendingMovieUseCase)
    : super(
        BasePaginatedInitial<BaseCardModel>(),
        _createPageLoader(fetchTrendingMovieUseCase),
      );
  final FetchTrendingMoviesUseCase fetchTrendingMovieUseCase;
  static PageLoader<BaseCardModel, TrendingParams> _createPageLoader(
    FetchTrendingMoviesUseCase useCase,
  ) {
    return ({
      required TrendingParams params,
      int? page,
      CancelToken? cancelToken,
    }) async {
      final result = await useCase.call(params, page, cancelToken);
      return result;
    };
  }
}
