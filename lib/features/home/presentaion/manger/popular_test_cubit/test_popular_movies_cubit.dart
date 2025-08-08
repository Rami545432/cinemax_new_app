import 'package:cinemax_app_new/core/utils/helper/base_pagination_cubit/base_paginated_cubit.dart';
import 'package:cinemax_app_new/core/utils/helper/base_pagination_cubit/base_paginated_states.dart';
import 'package:cinemax_app_new/features/home/domian/uses_cases/fetch_popular_use_case.dart';
import 'package:dio/dio.dart';

import '../../../../../core/utils/cubit_parameters/params.dart';
import '../../../../../models/base_card_model.dart';

class TestPopularMoviesCubit
    extends BasePaginatedCubit<BaseCardModel, PopularParams> {
  final FetchPopularUseCase fetchPopularUseCase;

  TestPopularMoviesCubit(this.fetchPopularUseCase)
    : super(
        BasePaginatedInitial<BaseCardModel>()
            as BasePaginatedStates<BaseCardModel>,
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

class TestPopularParams {
  final String type;
  final String sortBy;

  TestPopularParams({required this.type, required this.sortBy});
}
