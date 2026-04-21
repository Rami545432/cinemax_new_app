import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/pagination/domain/entites/page_result.dart';
import 'package:cinemax_app_new/features/discover/domain/repos/discover_repo.dart';
import 'package:cinemax_app_new/shared/domain/entites/series_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FetchSeriesByKeywordsUseCase {
  final DiscoverRepo repo;
  FetchSeriesByKeywordsUseCase({required this.repo});

  Future<Either<Failure, PageResult<SeriesEntity>>> call(
    int page,
    int keyword,
  ) => repo.fetchSeriesItemsByKeyword(page, keyword);
}
