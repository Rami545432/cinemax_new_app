import 'package:cinemax_app_new/core/utils/cubit_parameters/newest_params.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/errors/errors.dart';
import '../../../../core/utils/use_case/use_case.dart';
import '../entites/entity.dart';
import '../repos/home_repo.dart';

class FetchNewstMovieCase extends UseCase<List<MovieEntity>, NewestParams> {
  final HomeRepo homeRepo;

  FetchNewstMovieCase({required this.homeRepo});
  @override
  Future<Either<Failure, List<MovieEntity>>> call([
    NewestParams? parameter,
    int? page,
    CancelToken? cancelToken,
  ]) {
    return homeRepo.fetchUpcomingMovies(page: page!, cancelToken: cancelToken);
  }
}
