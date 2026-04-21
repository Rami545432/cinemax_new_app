import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/pagination/domain/entites/page_result.dart';
import 'package:cinemax_app_new/features/details/domain/repo/series_details_repo.dart';
import 'package:cinemax_app_new/shared/domain/entites/series_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FetchSeriesRecommendationsUseCase {
  final SeriesDetailsRepo seriesDetailsRepo;
  FetchSeriesRecommendationsUseCase({required this.seriesDetailsRepo});
  Future<Either<Failure, PageResult<SeriesEntity>>> call(
    int id,
    int? page,
  ) async => seriesDetailsRepo.fetchSeriesRecommendations(id, page);
}
