import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/pagination/domain/entites/page_result.dart';
import 'package:cinemax_app_new/features/home/domian/repos/home_repo.dart';
import 'package:cinemax_app_new/shared/domain/entites/movie_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetMoviesUseCase {
  final HomeRepo homeRepo;
  const GetMoviesUseCase({required this.homeRepo});
  Future<Either<Failure, PageResult<MovieEntity>>> call({
    int page = 1,
    String endPoint = 'popular',
  }) => homeRepo.getMovies(page: page, endPoint: endPoint);
}
