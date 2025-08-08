import 'package:cinemax_app_new/core/utils/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
import 'package:cinemax_app_new/features/series/domain/entites/series_entity.dart';
import 'package:cinemax_app_new/features/series/domain/repos/series_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/cubit_parameters/params.dart';

class FetchTvAiringTodayUseCase
    extends UseCase<List<SeriesEntity>, AiringTodayParams> {
  final SeriesRepo seriesRepo;

  FetchTvAiringTodayUseCase({required this.seriesRepo});
  @override
  Future<Either<Failure, List<SeriesEntity>>> call([
    AiringTodayParams? parameter,
    int? page,
    CancelToken? cancelToken,
  ]) {
    return seriesRepo.fetchTvAiringToday(page: page!, cancelToken: cancelToken);
  }
}
