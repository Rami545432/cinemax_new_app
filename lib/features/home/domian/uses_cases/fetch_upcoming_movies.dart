import 'package:cinemax_app_new/core/utils/cubit_parameters/newest_params.dart';
import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
import 'package:cinemax_app_new/features/home/data/models/test_model.dart';
import 'package:dio/dio.dart';

import '../entites/movie_entity.dart';
import '../repos/home_repo.dart';

class FetchUpcomingMovieCase
    extends UseCase<PagedResult<MovieEntity>, NewestParams> {
  final HomeRepo homeRepo;

  FetchUpcomingMovieCase({required this.homeRepo});
  @override
  call([NewestParams? parameter, int? page, CancelToken? cancelToken]) {
    return homeRepo.fetchUpcomingMovies(page: page!, cancelToken: cancelToken);
  }
}
