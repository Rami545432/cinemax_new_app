import 'package:dio/dio.dart';

import '../../../../../core/utils/cubit_parameters/params.dart';
import '../../../../../core/utils/helper/base_pagination_cubit/base_paginated_cubit.dart';
import '../../../../../core/utils/helper/base_pagination_cubit/base_paginated_states.dart';
import '../../../../../models/base_card_model.dart';
import '../../../domian/uses_cases/fetch_now_playing_movie.dart';

class FetchNowPlayingMoviesCubit
    extends BasePaginatedCubit<BaseCardModel, NowPlayingParams> {
  final FetchNowPlayingMovieUseCase fetchNowPlayingMovieUseCase;

  FetchNowPlayingMoviesCubit(this.fetchNowPlayingMovieUseCase)
    : super(
        BasePaginatedInitial<BaseCardModel>()
            as BasePaginatedStates<BaseCardModel>,
        _createPageLoader(fetchNowPlayingMovieUseCase),
      );

  static PageLoader<BaseCardModel, NowPlayingParams> _createPageLoader(
    FetchNowPlayingMovieUseCase useCase,
  ) {
    return ({
      required NowPlayingParams params,
      int? page,
      CancelToken? cancelToken,
    }) async {
      final result = await useCase.call(params, page, cancelToken);
      return result;
    };
  }
}
