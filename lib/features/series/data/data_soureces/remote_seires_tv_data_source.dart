import 'package:dio/dio.dart';

import '../../../../core/utils/services/api_service.dart';
import '../../domain/entites/series_entity.dart';
import '../../domain/entites/series_season_details_entitiy.dart';
import '../models/series_details_model/series_details_model.dart';
import '../models/series_model.dart';
import '../models/series_season_details/series_season_details.dart';

abstract class RemoteSeiresTvDataSource {
  Future<List<SeriesEntity>> fetchTrendingTvShows({
    int page = 1,
    CancelToken? cancelToken,
  });
  Future<List<SeriesEntity>> fetchPopularTvShows(
    dynamic generId, {
    int page = 1,
    CancelToken? cancelToken,
  });
  Future<List<SeriesEntity>> fetchTopRatedTvShows({
    int page = 1,
    CancelToken? cancelToken,
  });
  Future<SeriesDetailsModel> fetchTvShowDetail({
    required int tvid,
    CancelToken? cancelToken,
  });
  Future<SeriesSeasonDetailsEntitiy> fetchTvShowSeasonDetails({
    required int tvid,
    required num season,
    CancelToken? cancelToken,
  });
  Future<List<SeriesEntity>> fetchAiringTvShows({
    int page = 1,
    CancelToken? cancelToken,
  });
}

class RemoteSeiresTvDataSourceImpl extends RemoteSeiresTvDataSource {
  final ApiService apiService;

  RemoteSeiresTvDataSourceImpl({required this.apiService});
  @override
  Future<List<SeriesEntity>> fetchPopularTvShows(
    generId, {
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    List<SeriesEntity> tvShows = [];

    var data = await apiService.getGeneralTv(
      type: 'tv',
      page: page,
      cancelToken: cancelToken,
    );
    for (var show in data["results"]) {
      if (show['poster_path'] != null && show['original_language'] != 'ja') {
        tvShows.add(SeriesModel.fromJson(show));
      }
    }
    return tvShows;
  }

  @override
  Future<List<SeriesEntity>> fetchTopRatedTvShows({
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    List<SeriesEntity> tvShows = [];
    var data = await apiService.getTopRated(
      type: 'tv',
      page: page,
      cancelToken: cancelToken,
    );
    for (var show in data['results']) {
      if (show['poster_path'] != null) {
        tvShows.add(SeriesModel.fromJson(show));
      }
    }
    return tvShows;
  }

  @override
  Future<List<SeriesEntity>> fetchTrendingTvShows({
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    List<SeriesEntity> tvShows = [];
    var data = await apiService.getTrending(
      type: 'tv',
      cancelToken: cancelToken,
    );
    for (var show in data['results']) {
      if (show['poster_path'] != null &&
          show['original_language'] != 'ja' &&
          show['backdrop_path'] != null &&
          show['original_language'] != 'zh') {
        tvShows.add(SeriesModel.fromJson(show));
      }
    }
    return tvShows;
  }

  @override
  Future<SeriesDetailsModel> fetchTvShowDetail({
    required int tvid,
    CancelToken? cancelToken,
  }) async {
    var data = await apiService.getDetails(
      id: tvid,
      type: 'tv',
      cancelToken: cancelToken,
    );

    return (SeriesDetailsModel.fromJson(data));
  }

  @override
  Future<SeriesSeasonDetailsEntitiy> fetchTvShowSeasonDetails({
    required int tvid,
    required num season,
    CancelToken? cancelToken,
  }) async {
    var data = await apiService.getSeasonDetails(
      tvid: tvid,
      season: season,
      cancelToken: cancelToken,
    );

    return SeriesSeasonDetails.fromJson(data);
  }

  @override
  Future<List<SeriesEntity>> fetchAiringTvShows({
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    List<SeriesEntity> series = [];
    var data = await apiService.getAiringToday(
      type: 'tv',
      page: page,
      cancelToken: cancelToken,
    );

    for (var element in data['results']) {
      if (element['poster_path'] != null) {
        series.add(SeriesModel.fromJson(element));
      }
    }
    return series;
  }
}
