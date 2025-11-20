import 'package:cinemax_app_new/core/utils/cubit_parameters/params.dart';
import 'package:cinemax_app_new/core/utils/helper/base_pagination_cubit/base_paginated_cubit.dart';
import 'package:cinemax_app_new/core/utils/helper/base_pagination_cubit/base_paginated_states.dart';
import 'package:cinemax_app_new/models/base_card_model.dart';
import 'package:dio/dio.dart';

import '../../../domain/use_cases/fetch_tv_airing_today.use_case.dart';

class FetchAiringTodayCubit
    extends BasePaginatedCubit<BaseCardModel, AiringTodayParams> {
  FetchAiringTodayCubit(this.fetchTvAiringTodayUseCase)
    : super(
        BasePaginatedInitial<BaseCardModel>(),
        _createPageLoader(fetchTvAiringTodayUseCase),
      );
  final FetchAiringTodayTvShowsUseCase fetchTvAiringTodayUseCase;
  static PageLoader<BaseCardModel, AiringTodayParams> _createPageLoader(
    FetchAiringTodayTvShowsUseCase useCase,
  ) {
    return ({
      required AiringTodayParams params,
      int? page,
      CancelToken? cancelToken,
    }) async {
      final result = await useCase.call(params, page, cancelToken);
      return result;
    };
  }
}
