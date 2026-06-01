import 'package:dartz/dartz.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/core/pagination/domain/entites/page_result.dart';
import 'package:movify/features/discover/domain/repos/discover_repo.dart';
import 'package:movify/shared/domain/entites/movie_entity.dart';

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
