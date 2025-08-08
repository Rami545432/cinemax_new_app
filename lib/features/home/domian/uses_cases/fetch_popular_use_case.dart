import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/cubit_parameters/params.dart';
import '../../../../core/utils/errors/errors.dart';
import '../../../../core/utils/use_case/use_case.dart';
import '../entites/entity.dart';
import '../repos/home_repo.dart';

class FetchPopularUseCase extends UseCase<List<MovieEntity>, PopularParams> {
  final HomeRepo homeRepo;

  FetchPopularUseCase({required this.homeRepo});
  @override
  Future<Either<Failure, List<MovieEntity>>> call([
    PopularParams? params,
    int? page,
    CancelToken? cancelToken,
  ]) {
    return homeRepo.fetchPopularMovies(
      params?.sortBy,
      page: page!,
      cancelToken: cancelToken,
    );
  }
}
