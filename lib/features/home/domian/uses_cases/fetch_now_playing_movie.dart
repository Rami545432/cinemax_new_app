import 'package:cinemax_app_new/core/types/domain_types.dart';
import 'package:cinemax_app_new/core/utils/cubit_parameters/now_playing_params.dart';
import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
import 'package:cinemax_app_new/features/home/data/models/test_model.dart';
import 'package:cinemax_app_new/features/home/domian/entites/movie_entity.dart';
import 'package:cinemax_app_new/features/home/domian/repos/home_repo.dart';
import 'package:dio/dio.dart';

class FetchNowPlayingUseCase
    extends UseCase<PagedResult<MovieEntity>, NowPlayingParams> {
  final HomeRepo homeRepo;

  FetchNowPlayingUseCase({required this.homeRepo});
  @override
  // ignore: avoid_renaming_method_parameters
  MovieListResult call([
    NowPlayingParams? params,
    int? page,
    CancelToken? cancelToken,
  ]) {
    return homeRepo.fetchNowPlayingMovies(
      page: page!,
      cancelToken: cancelToken,
    );
  }
}
