import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/core/pagination/domain/entites/page_result.dart';
import 'package:movify/features/home/domian/repos/home_repo.dart';
import 'package:movify/shared/domain/entites/series_entity.dart';

@lazySingleton
class GetSeriesUseCase {
  final HomeRepo homeRepo;
  const GetSeriesUseCase({required this.homeRepo});
  Future<Either<Failure, PageResult<SeriesEntity>>> call({
    int page = 1,
    String endPoint = 'popular',
  }) => homeRepo.getTvShows(page: page, endPoint: endPoint);
}
