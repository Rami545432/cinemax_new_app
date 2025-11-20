import 'package:cinemax_app_new/core/types/domain_types.dart';
import 'package:cinemax_app_new/core/utils/cubit_parameters/top_rated_params.dart';
import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
import 'package:dio/dio.dart';

import '../entites/series_entity.dart';
import '../repos/series_repo.dart';

class FetchTopRatedTvShowsUseCase
    extends UseCase<List<SeriesEntity>, TopRatedParams> {
  final SeriesRepo seriesRepo;

  FetchTopRatedTvShowsUseCase({required this.seriesRepo});
  @override
  SeriesListResult call([
    TopRatedParams? parameter,
    int? page,
    CancelToken? cancelToken,
  ]) async {
    return await seriesRepo.fetchTopRatedTvShows(
      page: page!,
      cancelToken: cancelToken,
    );
  }
}
