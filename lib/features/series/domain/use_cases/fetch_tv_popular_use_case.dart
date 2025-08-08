import 'package:cinemax_app_new/core/utils/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
import 'package:cinemax_app_new/features/series/domain/repos/series_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/cubit_parameters/params.dart';
import '../entites/series_entity.dart';

class FetchPopularTvShowsUseCase
    extends UseCase<List<SeriesEntity>, PopularParams> {
  final SeriesRepo seriesRepo;

  FetchPopularTvShowsUseCase({required this.seriesRepo});
  @override
  // ignore: avoid_renaming_method_parameters
  Future<Either<Failure, List<SeriesEntity>>> call(
  // ignore: avoid_renaming_method_parameters
  [PopularParams? parameter, int? page, CancelToken? cancelToken]) async {
    return await seriesRepo.fetchPopularTvShows(
      parameter!.sortBy,
      page: page!,
      cancelToken: cancelToken,
    );
  }
}
