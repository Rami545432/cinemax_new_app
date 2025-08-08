import 'package:cinemax_app_new/features/series/domain/use_cases/fetch_tv_top_rated_use_case.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/utils/cubit_parameters/params.dart';
import '../../../../../core/utils/helper/base_pagination_cubit/base_paginated_cubit.dart';
import '../../../../../core/utils/helper/base_pagination_cubit/base_paginated_states.dart';
import '../../../../../models/base_card_model.dart';

part 'fetch_top_rated_tv_shows_state.dart';

class FetchTopRatedTvShowsCubit
    extends BasePaginatedCubit<BaseCardModel, TopRatedParams> {
  FetchTopRatedTvShowsCubit(this.fetchTopRatedTvShowsUseCase)
    : super(
        BasePaginatedInitial<BaseCardModel>()
            as BasePaginatedStates<BaseCardModel>,
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
