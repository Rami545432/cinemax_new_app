import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/errors/errors.dart';
import '../../../../core/utils/use_case/use_case.dart';
import '../../../home/domian/entites/entity.dart';
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
