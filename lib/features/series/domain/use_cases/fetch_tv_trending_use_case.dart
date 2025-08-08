import 'package:cinemax_app_new/core/utils/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
import 'package:cinemax_app_new/features/series/domain/repos/series_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/cubit_parameters/params.dart';
import '../entites/series_entity.dart';

class FetchTreningTvShowsUseCase
    extends UseCase<List<SeriesEntity>, TrendingParams> {
  final SeriesRepo seriesRepo;

  FetchTreningTvShowsUseCase({required this.seriesRepo});
  @override
  Future<Either<Failure, List<SeriesEntity>>> call([
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
