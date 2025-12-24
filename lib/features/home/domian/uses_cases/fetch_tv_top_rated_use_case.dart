import 'package:cinemax_app_new/core/types/domain_types.dart';
import 'package:cinemax_app_new/core/utils/cubit_parameters/top_rated_params.dart';
import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
import 'package:cinemax_app_new/features/home/data/models/test_model.dart';
import 'package:cinemax_app_new/features/home/domian/entites/series_entity.dart';
import 'package:cinemax_app_new/features/home/domian/repos/home_repo.dart';
import 'package:dio/dio.dart';

class FetchTopRatedTvShowsUseCase
    extends UseCase<PagedResult<SeriesEntity>, TopRatedParams> {
  final HomeRepo homeRepo;

  FetchTopRatedTvShowsUseCase({required this.homeRepo});
  @override
  SeriesListResult call([
    TopRatedParams? parameter,
    int? page,
    CancelToken? cancelToken,
  ]) async {
    return await homeRepo.fetchTopRatedTvShows(
      page: page!,
      cancelToken: cancelToken,
    );
  }
}
