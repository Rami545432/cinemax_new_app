import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/features/search/domain/repo/search_repo.dart';
import 'package:cinemax_app_new/shared/domain/entites/series_entity.dart';
import 'package:cinemax_app_new/shared/domain/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SearchSeriesUseCase implements UseCase<List<SeriesEntity>, String> {
  final SearchRepo searchRepo;

  const SearchSeriesUseCase({required this.searchRepo});
  @override
  Future<Either<Failure, List<SeriesEntity>>> call([String? parameter]) async =>
      searchRepo.searchTvShows(parameter!);
}
