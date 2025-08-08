import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/cubit_parameters/params.dart';
import '../../../../core/utils/errors/errors.dart';
import '../../../../core/utils/use_case/use_case.dart';
import '../entites/entity.dart';
import '../repos/home_repo.dart';

class FetchTopRatedMoviesUseCase
    extends UseCase<List<MovieEntity>, TopRatedParams> {
  final HomeRepo homeRepo;

  FetchTopRatedMoviesUseCase({required this.homeRepo});
  @override
  // ignore: avoid_renaming_method_parameters
  Future<Either<Failure, List<MovieEntity>>> call([
    TopRatedParams? params,
    int? page,
    CancelToken? cancelToken,
  ]) {
    return homeRepo.fetchTopRatedMovies(page: page!, cancelToken: cancelToken);
  }
}
