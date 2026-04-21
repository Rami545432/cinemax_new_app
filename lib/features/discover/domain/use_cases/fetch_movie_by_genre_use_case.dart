import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/pagination/domain/entites/page_result.dart';
import 'package:cinemax_app_new/features/discover/domain/entities/genre_filter.dart';
import 'package:cinemax_app_new/features/discover/domain/repos/discover_repo.dart';
import 'package:cinemax_app_new/shared/domain/entites/movie_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FetchMoviesByGenreUseCase {
  final DiscoverRepo repository;
  FetchMoviesByGenreUseCase(this.repository);

  Future<Either<Failure, PageResult<MovieEntity>>> call(
    int genreId,
    int page,
    GenreFilterParams params,
  ) => repository.fetchMoviesByGenre(genreId, page, params);
}
