import 'package:dio/dio.dart';

import '../../../../../core/utils/cubit_parameters/params.dart';
import '../../../../../core/utils/helper/base_pagination_cubit/base_paginated_cubit.dart';
import '../../../../../core/utils/helper/base_pagination_cubit/base_paginated_states.dart';
import '../../../../../models/base_card_model.dart';
import '../../../domian/uses_cases/fetch_upcoming_movies.dart';

class FetchUpcomingMoviesCubit
    extends BasePaginatedCubit<BaseCardModel, NewestParams> {
  final FetchUpcomingMovieCase fetchNewstMovieCase;

  FetchUpcomingMoviesCubit(this.fetchNewstMovieCase)
    : super(
        BasePaginatedInitial<BaseCardModel>(),
        _createPageLoader(fetchNewstMovieCase),
      );

  static PageLoader<BaseCardModel, NewestParams> _createPageLoader(
    FetchUpcomingMovieCase useCase,
  ) {
    return ({
      required NewestParams params,
      int? page,
      CancelToken? cancelToken,
    }) async {
      final result = await useCase.call(params, page, cancelToken);
      return result;
    };
  }
}
