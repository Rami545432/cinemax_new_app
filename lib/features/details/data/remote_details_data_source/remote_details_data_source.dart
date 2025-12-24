import 'package:cinemax_app_new/core/network/api/services/api_service.dart';
import 'package:cinemax_app_new/features/details/data/models/collection_model/collection_model.dart';
import 'package:cinemax_app_new/features/details/data/models/movie_details_model.dart';
import 'package:cinemax_app_new/features/details/data/models/series_details_models/series_details_model.dart';
import 'package:cinemax_app_new/features/details/data/models/series_season_details_model.dart';
import 'package:cinemax_app_new/features/home/data/models/movie_model.dart';
import 'package:cinemax_app_new/features/home/data/models/series_model.dart';
import 'package:cinemax_app_new/features/home/data/models/test_model.dart';
import 'package:cinemax_app_new/models/base_card_model.dart';
import 'package:dio/dio.dart';

abstract class RemoteDetailsDataSource {
  Future<MovieDetailsModel> fetchMovieDetails(
    int movieId,
    CancelToken? cancelToken,
  );
  Future<SeriesDetailsModel> fetchSeriesDetails(
    int seriesId,
    CancelToken? cancelToken,
  );
  Future<SeriesSeasonDetailsModel> fetchSeriesSeasonDetails(
    int seriesId,
    int seasonNumber,
    CancelToken? cancelToken,
  );
  Future<PagedResult<BaseCardModel>> fetchSimilarItems(
    int id,
    String type,
    int? page,
    CancelToken? cancelToken,
  );
  Future<PagedResult<BaseCardModel>> fetchRecommendations(
    int id,
    String type,
    int? page,
    CancelToken? cancelToken,
  );
  Future<CollectionModel> fetchCollection(
    int collectionId,
    CancelToken? cancelToken,
  );
}

class RemoteDetailsDataSourceImpl implements RemoteDetailsDataSource {
  final ApiService apiService;
  RemoteDetailsDataSourceImpl({required this.apiService});
  @override
  Future<MovieDetailsModel> fetchMovieDetails(
    int movieId,
    CancelToken? cancelToken,
  ) async {
    var data = await apiService.tmdb.details.getDetails(
      id: movieId,
      type: 'movie',
      cancelToken: cancelToken,
    );
    if (data['overview'] == '') {
      data['overview'] =
          data['translations']['translations'][0]['data']['overview'] ?? '';
    }

    return MovieDetailsModel.fromJson(data);
  }

  @override
  Future<PagedResult<BaseCardModel>> fetchRecommendations(
    int id,
    String type,
    int? page,
    CancelToken? cancelToken,
  ) async {
    List<BaseCardModel> recommendations = [];
    var data = await apiService.tmdb.details.getRecommendations(
      id: id,
      type: type,
      page: page,
      cancelToken: cancelToken,
    );
    for (var item in data['results']) {
      if (item['poster_path'] != null) {
        type == 'movie'
            ? recommendations.add(MovieModel.fromJson(item))
            : recommendations.add(SeriesModel.fromJson(item));
      }
    }
    return PagedResult<BaseCardModel>(
      page: data['page'],
      totalPages: data['total_pages'],
      totalResults: data['total_results'],
      results: recommendations,
    );
  }

  @override
  Future<SeriesDetailsModel> fetchSeriesDetails(
    int seriesId,
    CancelToken? cancelToken,
  ) async {
    var data = await apiService.tmdb.details.getDetails(
      id: seriesId,
      type: 'tv',
      cancelToken: cancelToken,
    );
    if (data['overview'] == '') {
      data['overview'] =
          data['translations']['translations'][0]['data']['overview'] ?? '';
    }
    return SeriesDetailsModel.fromJson(data);
  }

  @override
  Future<SeriesSeasonDetailsModel> fetchSeriesSeasonDetails(
    int seriesId,
    int seasonNumber,
    CancelToken? cancelToken,
  ) async {
    var data = await apiService.tmdb.details.getSeasonDetails(
      tvid: seriesId,
      season: seasonNumber,
      cancelToken: cancelToken,
    );
    if (data['overview'] == '') {
      data['overview'] =
          data['translations']['translations'][0]['data']['overview'] ?? '';
    }
    return SeriesSeasonDetailsModel.fromJson(data);
  }

  @override
  Future<PagedResult<BaseCardModel>> fetchSimilarItems(
    int id,
    String type,
    int? page,
    CancelToken? cancelToken,
  ) async {
    List<BaseCardModel> similarItems = [];
    var data = await apiService.tmdb.details.getSimilar(
      id: id,
      type: type,
      page: page ?? 1,
      cancelToken: cancelToken,
    );
    for (var item in data['results']) {
      if (item['poster_path'] != null) {
        type == 'movie'
            ? similarItems.add(MovieModel.fromJson(item))
            : similarItems.add(SeriesModel.fromJson(item));
      }
    }
    return PagedResult<BaseCardModel>(
      page: data['page'],
      totalPages: data['total_pages'],
      totalResults: data['total_results'],
      results: similarItems,
    );
  }

  @override
  Future<CollectionModel> fetchCollection(
    int collectionId,
    CancelToken? cancelToken,
  ) async {
    var data = await apiService.tmdb.details.getCollection(
      id: collectionId,
      cancelToken: cancelToken,
    );
    return CollectionModel.fromJson(data);
  }
}
