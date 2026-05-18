import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/core/pagination/domain/entites/page_result.dart';
import 'package:movify/features/details/domain/repo/series_details_repo.dart';
import 'package:movify/shared/domain/entites/series_entity.dart';

@lazySingleton
class FetchSimilarSeriesUseCase {
  final SeriesDetailsRepo seriesDetailsRepo;
  FetchSimilarSeriesUseCase({required this.seriesDetailsRepo});
  Future<Either<Failure, PageResult<SeriesEntity>>> call(
    int id,
    int? page,
  ) async => seriesDetailsRepo.fetchSeriesSimilarItems(id, page);
}
