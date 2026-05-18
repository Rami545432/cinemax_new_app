import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movify/core/domain/use_cases/use_case.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/features/search/domain/repo/search_repo.dart';
import 'package:movify/shared/domain/entites/series_entity.dart';

@lazySingleton
class SearchSeriesUseCase implements UseCase<List<SeriesEntity>, String> {
  final SearchRepo searchRepo;

  const SearchSeriesUseCase({required this.searchRepo});
  @override
  Future<Either<Failure, List<SeriesEntity>>> call([String? parameter]) async =>
      searchRepo.searchTvShows(parameter!);
}
