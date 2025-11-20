import 'package:cinemax_app_new/core/types/domain_types.dart';
import 'package:cinemax_app_new/core/utils/cubit_parameters/params.dart';
import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
import 'package:dio/dio.dart';

import '../entites/movie_entity.dart';
import '../repos/home_repo.dart';

class FetchPopularUseCase extends UseCase<List<MovieEntity>, PopularParams> {
  final HomeRepo homeRepo;

  FetchPopularUseCase({required this.homeRepo});
  @override
  MovieListResult call([
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
