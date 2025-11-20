import 'package:cinemax_app_new/core/types/domain_types.dart';
import 'package:cinemax_app_new/core/utils/cubit_parameters/popular_params.dart';
import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
import 'package:cinemax_app_new/features/series/domain/repos/series_repo.dart';
import 'package:dio/dio.dart';

import '../entites/series_entity.dart';

class FetchPopularTvShowsUseCase
    extends UseCase<List<SeriesEntity>, PopularParams> {
  final SeriesRepo seriesRepo;

  FetchPopularTvShowsUseCase({required this.seriesRepo});
  @override
  SeriesListResult call([
    PopularParams? parameter,
    int? page,
    CancelToken? cancelToken,
  ]) async {
    return await seriesRepo.fetchPopularTvShows(
      parameter!.sortBy,
      page: page!,
      cancelToken: cancelToken,
    );
  }
}
