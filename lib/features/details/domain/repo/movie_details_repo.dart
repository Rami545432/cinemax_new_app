import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/core/types/domain_types.dart';
import 'package:cinemax_app_new/core/utils/pagination/domain/entites/page_result.dart';
import 'package:cinemax_app_new/shared/domain/entites/movie_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class MovieDetailsRepo {
  MovieDetailsResult fetchMovieDetails(int movieId);
  Future<Either<Failure, PageResult<MovieEntity>>> fetchMoviesRecommendations(
    int id,
    int? page,
  );
  Future<Either<Failure, PageResult<MovieEntity>>> fetchMoviesSimilarItems(
    int id,
    int? page,
  );
  CollectionResult fetchMovieCollections(int collectionId);
}
