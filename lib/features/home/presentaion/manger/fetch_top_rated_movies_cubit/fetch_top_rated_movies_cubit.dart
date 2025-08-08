import 'package:dio/dio.dart';

import '../../../../../core/utils/cubit_parameters/params.dart';
import '../../../../../core/utils/helper/base_pagination_cubit/base_paginated_cubit.dart';
import '../../../../../core/utils/helper/base_pagination_cubit/base_paginated_states.dart';
import '../../../../../models/base_card_model.dart';
import '../../../domian/uses_cases/fetch_top_rated_movies.dart';

class FetchTopRatedMoviesCubit
    extends BasePaginatedCubit<BaseCardModel, TopRatedParams> {
  final FetchTopRatedMoviesUseCase fetchTopRatedMoviesUseCase;

  FetchTopRatedMoviesCubit(this.fetchTopRatedMoviesUseCase)
    : super(
        BasePaginatedInitial<BaseCardModel>()
            as BasePaginatedStates<BaseCardModel>,
        _createPageLoader(fetchTopRatedMoviesUseCase),
      );

  static PageLoader<BaseCardModel, TopRatedParams> _createPageLoader(
    FetchTopRatedMoviesUseCase useCase,
  ) {
    return ({
      required TopRatedParams params,
      int? page,
      CancelToken? cancelToken,
    }) async {
      final result = await useCase.call(params, page, cancelToken);
      return result;
    };
  }
}
