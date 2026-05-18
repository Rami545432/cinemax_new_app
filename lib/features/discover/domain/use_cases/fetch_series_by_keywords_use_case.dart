import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/core/pagination/domain/entites/page_result.dart';
import 'package:movify/features/discover/domain/repos/discover_repo.dart';
import 'package:movify/shared/domain/entites/series_entity.dart';

@lazySingleton
class FetchSeriesByKeywordsUseCase {
  final DiscoverRepo repo;
  FetchSeriesByKeywordsUseCase({required this.repo});

  Future<Either<Failure, PageResult<SeriesEntity>>> call(
    int page,
    int keyword,
  ) => repo.fetchSeriesItemsByKeyword(page, keyword);
}
