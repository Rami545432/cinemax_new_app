import 'package:cinemax_app_new/core/utils/errors/errors.dart';
import 'package:cinemax_app_new/features/home/domian/entites/movie_entity.dart';
import 'package:cinemax_app_new/features/search/domain/entities/search_actor_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../series/domain/entites/series_entity.dart';
import '../../data/models/search_history_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<MovieEntity>>> searchMovies(
    String query,
    CancelToken? cancelToken,
  );
  Future<Either<Failure, List<SeriesEntity>>> searchTvShows(
    String query,
    CancelToken? cancelToken,
  );
  Future<Either<Failure, List<SearchActorEntity>>> searchActor(
    String query,
    CancelToken? cancelToken,
  );
  Future<void> clearSearchHistory();
  Future<void> addToSearchHistory(SearchHistoryModel searchHistory);
  Future<List<SearchHistoryModel>> getSearchHistory();
  Future<void> deleteSearchHistory(int id);
}
