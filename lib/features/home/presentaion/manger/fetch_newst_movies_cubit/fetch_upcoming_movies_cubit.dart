import 'package:dio/dio.dart';

import '../../../../../core/utils/cubit_parameters/params.dart';
import '../../../../../core/utils/helper/base_pagination_cubit/base_paginated_cubit.dart';
import '../../../../../core/utils/helper/base_pagination_cubit/base_paginated_states.dart';
import '../../../../../models/base_card_model.dart';
import '../../../domian/uses_cases/fetch_newst_movies.dart';

class FetchUpcomingMoviesCubit
    extends BasePaginatedCubit<BaseCardModel, NewestParams> {
  final FetchNewstMovieCase fetchNewstMovieCase;

  FetchUpcomingMoviesCubit(this.fetchNewstMovieCase)
    : super(
        BasePaginatedInitial<BaseCardModel>()
            as BasePaginatedStates<BaseCardModel>,
        _createPageLoader(fetchNewstMovieCase),
      );

  static PageLoader<BaseCardModel, NewestParams> _createPageLoader(
    FetchNewstMovieCase useCase,
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
