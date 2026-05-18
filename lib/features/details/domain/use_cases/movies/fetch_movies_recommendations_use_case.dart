import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/core/pagination/domain/entites/page_result.dart';
import 'package:movify/features/details/domain/repo/movie_details_repo.dart';
import 'package:movify/shared/domain/entites/movie_entity.dart';

@lazySingleton
class FetchMoviesRecommendationsUseCase {
  final MovieDetailsRepo movieDetailsRepo;
  FetchMoviesRecommendationsUseCase({required this.movieDetailsRepo});
  Future<Either<Failure, PageResult<MovieEntity>>> call(
    int id,
    int? page,
  ) async => movieDetailsRepo.fetchMoviesRecommendations(id, page);
}

// class RecomendedParams {
//   final int id;

//   RecomendedParams({required this.id});
// }
