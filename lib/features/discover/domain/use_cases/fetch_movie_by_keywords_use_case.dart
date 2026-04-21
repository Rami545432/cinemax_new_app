import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/pagination/domain/entites/page_result.dart';
import 'package:cinemax_app_new/features/discover/domain/repos/discover_repo.dart';
import 'package:cinemax_app_new/shared/domain/entites/movie_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FetchMoviesByKeywordsUseCase {
  final DiscoverRepo repo;
  FetchMoviesByKeywordsUseCase({required this.repo});

  Future<Either<Failure, PageResult<MovieEntity>>> call(
    int page,
    int keyword,
  ) => repo.fetchMoviesItemsByKeyword(page, keyword);
}

class FetchItemsByKeywordsParams {
  final int keyword;
  FetchItemsByKeywordsParams({required this.keyword});
}
