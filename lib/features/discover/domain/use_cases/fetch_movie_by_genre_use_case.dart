import 'package:dartz/dartz.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/core/pagination/domain/entites/page_result.dart';
import 'package:movify/features/discover/domain/entities/genre_filter.dart';
import 'package:movify/features/discover/domain/repos/discover_repo.dart';
import 'package:movify/shared/domain/entites/movie_entity.dart';

class FetchMoviesByGenreUseCase {
  final DiscoverRepo repository;
  FetchMoviesByGenreUseCase(this.repository);

  Future<Either<Failure, PageResult<MovieEntity>>> call(
    int genreId,
    int page,
    GenreFilterParams params,
  ) => repository.fetchMoviesByGenre(genreId, page, params);
}
