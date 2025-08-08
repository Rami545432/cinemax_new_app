import 'package:cinemax_app_new/core/utils/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
import 'package:cinemax_app_new/features/series/domain/entites/series_season_details_entitiy.dart';
import 'package:cinemax_app_new/features/series/domain/repos/series_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FetchSeriesSeasonDetailsUseCase
    extends UseCase<SeriesSeasonDetailsEntitiy, int> {
  final SeriesRepo seriesRepo;

  FetchSeriesSeasonDetailsUseCase({required this.seriesRepo});
  @override
  Future<Either<Failure, SeriesSeasonDetailsEntitiy>> call(
  // ignore: avoid_renaming_method_parameters
  [int? tvid, num? season, CancelToken? cancelToken]) async {
    return await seriesRepo.fetchTvShowSeasonDetails(
      tvid: tvid!,
      season: season!,
      cancelToken: cancelToken,
    );
  }
}
