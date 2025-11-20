import 'package:cinemax_app_new/core/types/domain_types.dart';
import 'package:cinemax_app_new/core/utils/cubit_parameters/trending_params.dart';
import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
import 'package:dio/dio.dart';

import '../entites/movie_entity.dart';
import '../repos/home_repo.dart';

class FetchTrendingMoviesUseCase
    extends UseCase<List<MovieEntity>, TrendingParams> {
  final HomeRepo homeRepo;

  FetchTrendingMoviesUseCase({required this.homeRepo});
  @override
  // ignore: avoid_renaming_method_parameters
  MovieListResult call([
    TrendingParams? parameter,
    int? page,
    CancelToken? cancelToken,
  ]) {
    return homeRepo.fetchTrendingMovies(page: page!, cancelToken: cancelToken);
  }
}
