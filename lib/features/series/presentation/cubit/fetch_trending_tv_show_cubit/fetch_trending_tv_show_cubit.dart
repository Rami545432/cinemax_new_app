import 'package:cinemax_app_new/core/utils/cubit_parameters/trending_params.dart';
import 'package:cinemax_app_new/core/utils/helper/base_pagination_cubit/base_paginated_cubit.dart';
import 'package:cinemax_app_new/core/utils/helper/base_pagination_cubit/base_paginated_states.dart';
import 'package:cinemax_app_new/features/series/domain/use_cases/fetch_tv_trending_use_case.dart';
import 'package:cinemax_app_new/models/base_card_model.dart';
import 'package:dio/dio.dart';

import '../../../domain/entites/series_entity.dart';

part 'fetch_trending_tv_show_state.dart';

class FetchTrendingTvShowCubit
    extends BasePaginatedCubit<BaseCardModel, TrendingParams> {
  FetchTrendingTvShowCubit(this.fetchTreningTvShowsUseCase)
    : super(
        BasePaginatedInitial<BaseCardModel>(),
        _createPageLoader(fetchTreningTvShowsUseCase),
      );
  final FetchTrendingTvShowUseCase fetchTreningTvShowsUseCase;
  static PageLoader<BaseCardModel, TrendingParams> _createPageLoader(
    FetchTrendingTvShowUseCase useCase,
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
