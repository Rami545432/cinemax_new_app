import 'package:dartz/dartz.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/core/pagination/domain/entites/page_result.dart';
import 'package:movify/features/details/domain/repo/movie_details_repo.dart';
import 'package:movify/shared/domain/entites/movie_entity.dart';

class FetchSimilarMoviesUseCase {
  final MovieDetailsRepo movieDetailsRepo;
  FetchSimilarMoviesUseCase({required this.movieDetailsRepo});
  Future<Either<Failure, PageResult<MovieEntity>>> call(
    int id,
    int? page,
  ) async => movieDetailsRepo.fetchMoviesSimilarItems(id, page);
}

class SimilarParams {
  final int id;
  SimilarParams({required this.id});
}
