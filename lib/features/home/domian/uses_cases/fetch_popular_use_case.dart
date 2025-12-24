import 'package:cinemax_app_new/core/types/domain_types.dart';
import 'package:cinemax_app_new/core/utils/cubit_parameters/params.dart';
import 'package:cinemax_app_new/core/utils/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
import 'package:cinemax_app_new/features/home/data/models/test_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../entites/movie_entity.dart';
import '../repos/home_repo.dart';

class FetchPopularUseCase
    extends UseCase<PagedResult<MovieEntity>, PopularParams> {
  final HomeRepo homeRepo;

  FetchPopularUseCase({required this.homeRepo});
  @override
  Future<Either<Failure, PagedResult<MovieEntity>>> call([
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
