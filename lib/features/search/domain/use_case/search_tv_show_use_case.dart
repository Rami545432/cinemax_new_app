import 'package:cinemax_app_new/core/utils/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../series/domain/entites/series_entity.dart';
import '../repo/search_repo.dart';

class SearchTvShowUseCase extends UseCase<List<SeriesEntity>, String> {
  final SearchRepo searchRepo;

  SearchTvShowUseCase({required this.searchRepo});
  @override
  Future<Either<Failure, List<SeriesEntity>>> call([
    String? parameter,
    CancelToken? cancelToken,
  ]) async {
    return await searchRepo.searchTvShows(parameter!, cancelToken);
  }
}
