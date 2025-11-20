import 'package:dio/dio.dart';

import '../../../../../core/utils/cubit_parameters/params.dart';
import '../../../../../core/utils/helper/base_pagination_cubit/base_paginated_cubit.dart';
import '../../../../../core/utils/helper/base_pagination_cubit/base_paginated_states.dart';
import '../../../../../models/base_card_model.dart';
import '../../../domian/uses_cases/fetch_now_playing_movie.dart';

class FetchNowPlayingMoviesCubit
    extends BasePaginatedCubit<BaseCardModel, NowPlayingParams> {
  final FetchNowPlayingUseCase fetchNowPlayingUseCase;

  FetchNowPlayingMoviesCubit(this.fetchNowPlayingUseCase)
    : super(
        BasePaginatedInitial<BaseCardModel>(),
        _createPageLoader(fetchNowPlayingUseCase),
      );

  static PageLoader<BaseCardModel, NowPlayingParams> _createPageLoader(
    FetchNowPlayingUseCase useCase,
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
