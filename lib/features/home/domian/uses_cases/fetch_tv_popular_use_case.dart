import 'package:cinemax_app_new/core/types/domain_types.dart';
import 'package:cinemax_app_new/core/utils/cubit_parameters/popular_params.dart';
import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
import 'package:cinemax_app_new/features/home/data/models/test_model.dart';
import 'package:cinemax_app_new/features/home/domian/entites/series_entity.dart';
import 'package:cinemax_app_new/features/home/domian/repos/home_repo.dart';
import 'package:dio/dio.dart';

class FetchPopularTvShowsUseCase
    extends UseCase<PagedResult<SeriesEntity>, PopularParams> {
  final HomeRepo homeRepo;

  FetchPopularTvShowsUseCase({required this.homeRepo});
  @override
  SeriesListResult call([
    PopularParams? parameter,
    int? page,
    CancelToken? cancelToken,
  ]) async {
    return await homeRepo.fetchPopularTvShows(
      parameter!.sortBy,
      page: page!,
      cancelToken: cancelToken,
    );
  }
}
