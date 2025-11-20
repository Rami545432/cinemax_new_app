import 'package:cinemax_app_new/core/utils/cubit_parameters/popular_params.dart';
import 'package:cinemax_app_new/core/utils/helper/base_pagination_cubit/base_paginated_cubit.dart';
import 'package:cinemax_app_new/core/utils/helper/base_pagination_cubit/base_paginated_states.dart';
import 'package:cinemax_app_new/models/base_card_model.dart';
import 'package:dio/dio.dart';

import '../../../domain/entites/series_entity.dart';
import '../../../domain/use_cases/fetch_tv_popular_use_case.dart';

part 'fetch_popular_tv_shows_state.dart';

class FetchPopularTvShowsCubit
    extends BasePaginatedCubit<BaseCardModel, PopularParams> {
  FetchPopularTvShowsCubit(this.fetchPopularTvShowsUseCase)
    : super(
        BasePaginatedInitial<BaseCardModel>(),
        _createPageLoader(fetchPopularTvShowsUseCase),
      );
  final FetchPopularTvShowsUseCase fetchPopularTvShowsUseCase;
  static PageLoader<BaseCardModel, PopularParams> _createPageLoader(
    FetchPopularTvShowsUseCase useCase,
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
