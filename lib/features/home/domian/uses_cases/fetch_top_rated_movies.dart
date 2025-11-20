import 'package:cinemax_app_new/core/types/domain_types.dart';
import 'package:cinemax_app_new/core/utils/cubit_parameters/top_rated_params.dart';
import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
import 'package:dio/dio.dart';

import '../entites/movie_entity.dart';
import '../repos/home_repo.dart';

class FetchTopRatedMoviesUseCase
    extends UseCase<List<MovieEntity>, TopRatedParams> {
  final HomeRepo homeRepo;

  FetchTopRatedMoviesUseCase({required this.homeRepo});
  @override
  // ignore: avoid_renaming_method_parameters
  MovieListResult call([
    TopRatedParams? params,
    int? page,
    CancelToken? cancelToken,
  ]) {
    return homeRepo.fetchTopRatedMovies(page: page!, cancelToken: cancelToken);
  }
}
