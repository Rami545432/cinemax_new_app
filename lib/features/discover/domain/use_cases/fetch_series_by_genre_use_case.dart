import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/core/pagination/domain/entites/page_result.dart';
import 'package:movify/features/discover/domain/entities/genre_filter.dart';
import 'package:movify/features/discover/domain/repos/discover_repo.dart';
import 'package:movify/shared/domain/entites/series_entity.dart';

@lazySingleton
class FetchSeriesByGenreUseCase {
  final DiscoverRepo repository;
  FetchSeriesByGenreUseCase(this.repository);

  Future<Either<Failure, PageResult<SeriesEntity>>> call(
    int genreId,
    int page,
    GenreFilterParams params,
  ) => repository.fetchSeriesByGenre(genreId, page, params);
}
