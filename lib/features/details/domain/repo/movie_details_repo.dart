import 'package:dartz/dartz.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/core/pagination/domain/entites/page_result.dart';
import 'package:movify/core/types/domain_types.dart';
import 'package:movify/shared/domain/entites/movie_entity.dart';

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
