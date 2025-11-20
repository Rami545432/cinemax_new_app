import 'package:cinemax_app_new/core/utils/cubit_parameters/top_rated_params.dart';
import 'package:cinemax_app_new/core/utils/helper/base_pagination_cubit/base_paginated_cubit.dart';
import 'package:cinemax_app_new/core/utils/helper/base_pagination_cubit/base_paginated_states.dart';
import 'package:cinemax_app_new/features/series/domain/use_cases/fetch_tv_top_rated_use_case.dart';
import 'package:cinemax_app_new/models/base_card_model.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'fetch_top_rated_tv_shows_state.dart';

class FetchTopRatedTvShowsCubit
    extends BasePaginatedCubit<BaseCardModel, TopRatedParams> {
  FetchTopRatedTvShowsCubit(this.fetchTopRatedTvShowsUseCase)
    : super(
        BasePaginatedInitial<BaseCardModel>(),
        _createPageLoader(fetchTopRatedTvShowsUseCase),
      );
  final FetchTopRatedTvShowsUseCase fetchTopRatedTvShowsUseCase;
  static PageLoader<BaseCardModel, TopRatedParams> _createPageLoader(
    FetchTopRatedTvShowsUseCase useCase,
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
