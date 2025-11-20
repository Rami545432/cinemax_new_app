import 'package:cinemax_app_new/core/utils/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../home/domian/entites/movie_entity.dart';
import '../repo/search_repo.dart';

class SearchMovieUseCase extends UseCase<List<MovieEntity>, String> {
  final SearchRepo searchRepo;

  SearchMovieUseCase({required this.searchRepo});
  @override
  Future<Either<Failure, List<MovieEntity>>> call([
    String? parameter,
    CancelToken? cancelToken,
  ]) {
    return searchRepo.searchMovies(parameter!, cancelToken);
  }
}
