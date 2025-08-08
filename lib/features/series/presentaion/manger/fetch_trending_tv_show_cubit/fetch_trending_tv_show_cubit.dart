import 'package:cinemax_app_new/features/series/domain/use_cases/fetch_tv_trending_use_case.dart';
import 'package:dio/dio.dart';

import '../../../../../core/utils/cubit_parameters/params.dart';
import '../../../../../core/utils/helper/base_pagination_cubit/base_paginated_cubit.dart';
import '../../../../../core/utils/helper/base_pagination_cubit/base_paginated_states.dart';
import '../../../../../models/base_card_model.dart';
import '../../../domain/entites/series_entity.dart';

part 'fetch_trending_tv_show_state.dart';

class FetchTrendingTvShowCubit
    extends BasePaginatedCubit<BaseCardModel, TrendingParams> {
  FetchTrendingTvShowCubit(this.fetchTreningTvShowsUseCase)
    : super(
        BasePaginatedInitial<BaseCardModel>()
            as BasePaginatedStates<BaseCardModel>,
        _createPageLoader(fetchTreningTvShowsUseCase),
      );
  final FetchTreningTvShowsUseCase fetchTreningTvShowsUseCase;
  static PageLoader<BaseCardModel, TrendingParams> _createPageLoader(
    FetchTreningTvShowsUseCase useCase,
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
