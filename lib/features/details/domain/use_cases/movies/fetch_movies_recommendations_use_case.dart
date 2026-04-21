import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/pagination/domain/entites/page_result.dart';
import 'package:cinemax_app_new/features/details/domain/repo/movie_details_repo.dart';
import 'package:cinemax_app_new/shared/domain/entites/movie_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

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
