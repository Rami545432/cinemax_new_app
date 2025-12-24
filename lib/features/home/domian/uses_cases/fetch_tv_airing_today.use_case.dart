import 'package:cinemax_app_new/core/utils/cubit_parameters/airing_today_params.dart';
import 'package:cinemax_app_new/core/utils/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
import 'package:cinemax_app_new/features/home/data/models/test_model.dart';
import 'package:cinemax_app_new/features/home/domian/entites/series_entity.dart';
import 'package:cinemax_app_new/features/home/domian/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FetchAiringTodayTvShowsUseCase
    extends UseCase<PagedResult<SeriesEntity>, AiringTodayParams> {
  final HomeRepo homeRepo;

  FetchAiringTodayTvShowsUseCase({required this.homeRepo});
  @override
  Future<Either<Failure, PagedResult<SeriesEntity>>> call([
    AiringTodayParams? parameter,
    int? page,
    CancelToken? cancelToken,
  ]) {
    return homeRepo.fetchTvAiringToday(page: page!, cancelToken: cancelToken);
  }
}
