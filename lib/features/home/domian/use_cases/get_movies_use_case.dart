import 'package:dartz/dartz.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/core/pagination/domain/entites/page_result.dart';
import 'package:movify/features/home/domian/repos/home_repo.dart';
import 'package:movify/shared/domain/entites/movie_entity.dart';

class GetMoviesUseCase {
  final HomeRepo homeRepo;
  const GetMoviesUseCase({required this.homeRepo});
  Future<Either<Failure, PageResult<MovieEntity>>> call({
    int page = 1,
    String endPoint = 'popular',
  }) => homeRepo.getMovies(page: page, endPoint: endPoint);
}
