import 'package:cinemax_app_new/core/utils/errors/errors.dart';
import 'package:cinemax_app_new/features/discover/data/models/genre_filter.dart';
import 'package:cinemax_app_new/features/discover/domain/repos/discover_repo.dart';
import 'package:cinemax_app_new/features/home/data/models/test_model.dart';
import 'package:cinemax_app_new/models/base_card_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FetchGenreContentUseCase {
  final DiscoverRepo repository;

  FetchGenreContentUseCase(this.repository);

  Future<Either<Failure, PagedResult<BaseCardModel>>> call({
    required GenreCategory contentType,
    required GenreFilterParams params,
    required int page,
    CancelToken? cancelToken,
  }) async {
    switch (contentType) {
      case GenreCategory.movies:
        return repository.fetchMoviesByGenre(
          params.copyWith(page: page),
          cancelToken,
        );

      case GenreCategory.tv:
        return repository.fetchSeriesByGenre(
          params.copyWith(page: page),
          cancelToken,
        );
    }
  }
}
