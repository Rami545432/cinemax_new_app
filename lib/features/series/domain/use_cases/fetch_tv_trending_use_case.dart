import 'package:cinemax_app_new/core/types/domain_types.dart';
import 'package:cinemax_app_new/core/utils/cubit_parameters/trending_params.dart';
import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
import 'package:cinemax_app_new/features/series/domain/repos/series_repo.dart';
import 'package:dio/dio.dart';

import '../entites/series_entity.dart';

class FetchTrendingTvShowUseCase
    extends UseCase<List<SeriesEntity>, TrendingParams> {
  final SeriesRepo seriesRepo;

  FetchTrendingTvShowUseCase({required this.seriesRepo});
  @override
  SeriesListResult call([
    TrendingParams? parameter,
    int? page,
    CancelToken? cancelToken,
  ]) async {
    return await seriesRepo.fetchTrendingTvShows(
      cancelToken: cancelToken,
      page: page!,
    );
  }
}
