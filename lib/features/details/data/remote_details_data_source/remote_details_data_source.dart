import 'package:cinemax_app_new/core/network/api/services/api_service.dart';
import 'package:cinemax_app_new/features/details/data/models/movie_details_model.dart';
import 'package:cinemax_app_new/features/details/data/models/series_details_models/series_details_model.dart';
import 'package:cinemax_app_new/features/details/data/models/series_season_details_model.dart';
import 'package:cinemax_app_new/features/home/data/models/movie_model.dart';
import 'package:cinemax_app_new/features/series/data/models/series_model.dart';
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
  Future<List<BaseCardModel>> fetchSimilarItems(
    int id,
    String type,
    int? page,
    CancelToken? cancelToken,
  );
  Future<List<BaseCardModel>> fetchRecommendations(
    int id,
    String type,
    int? page,
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
    var data = await apiService.getDetails(
      id: movieId,
      type: 'movie',
      cancelToken: cancelToken,
    );
    if (data['overview'] == '') {
      data['overview'] =
          data['translations']['translations'][0]['data']['overview'] ?? '';

      return MovieDetailsModel.fromJson(data);
    } else {
      return MovieDetailsModel.fromJson(data);
    }
  }

  @override
  Future<List<BaseCardModel>> fetchRecommendations(
    int id,
    String type,
    int? page,
    CancelToken? cancelToken,
  ) async {
    List<BaseCardModel> recommendations = [];
    var data = await apiService.getRecommendations(
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
    return recommendations;
  }

  @override
  Future<SeriesDetailsModel> fetchSeriesDetails(
    int seriesId,
    CancelToken? cancelToken,
  ) async {
    var data = await apiService.getDetails(
      id: seriesId,
      type: 'tv',
      cancelToken: cancelToken,
    );
    if (data['overview'] == '' || data['tagline'] == '') {
      data['overview'] =
          data['translations']['translations'][0]['data']['overview'] ?? '';
      data['tagline'] =
          data['translations']['translations'][0]['data']['tagline'] ?? '';
      data['translations'] = data['translations']['translations'][0]['data'];
      return SeriesDetailsModel.fromJson(data);
    } else {
      return SeriesDetailsModel.fromJson(data);
    }
  }

  @override
  Future<SeriesSeasonDetailsModel> fetchSeriesSeasonDetails(
    int seriesId,
    int seasonNumber,
    CancelToken? cancelToken,
  ) async {
    var data = await apiService.getSeasonDetails(
      tvid: seriesId,
      season: seasonNumber,
      cancelToken: cancelToken,
    );
    return SeriesSeasonDetailsModel.fromJson(data);
  }

  @override
  Future<List<BaseCardModel>> fetchSimilarItems(
    int id,
    String type,
    int? page,
    CancelToken? cancelToken,
  ) async {
    List<BaseCardModel> similarItems = [];
    var data = await apiService.getSimilar(
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
    return similarItems;
  }
}
