import 'package:cinemax_app_new/core/network/api/services/api_service.dart';
import 'package:cinemax_app_new/core/types/data_source_types.dart';
import 'package:dio/dio.dart';

import '../../../details/domain/entites/series_season_details_entitiy.dart';
import '../models/series_model.dart';
import '../../../details/data/models/series_season_details_model.dart';

abstract class RemoteSeiresTvDataSource {
  RemoteDataSourceListSeriesEntity fetchTrendingTvShows({
    int page = 1,
    CancelToken? cancelToken,
  });
  RemoteDataSourceListSeriesEntity fetchPopularTvShows(
    dynamic generId, {
    int page = 1,
    CancelToken? cancelToken,
  });
  RemoteDataSourceListSeriesEntity fetchTopRatedTvShows({
    int page = 1,
    CancelToken? cancelToken,
  });

  Future<SeriesSeasonDetailsEntitiy> fetchTvShowSeasonDetails({
    required int tvid,
    required num season,
    CancelToken? cancelToken,
  });
  RemoteDataSourceListSeriesEntity fetchAiringTvShows({
    int page = 1,
    CancelToken? cancelToken,
  });
}

class RemoteSeiresTvDataSourceImpl extends RemoteSeiresTvDataSource {
  final ApiService apiService;

  RemoteSeiresTvDataSourceImpl({required this.apiService});
  @override
  RemoteDataSourceListSeriesEntity fetchPopularTvShows(
    generId, {
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    List<SeriesModel> tvShows = [];

    var data = await apiService.getPopular(
      genreId: generId,
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
  RemoteDataSourceListSeriesEntity fetchTopRatedTvShows({
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    List<SeriesModel> tvShows = [];
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
  RemoteDataSourceListSeriesEntity fetchTrendingTvShows({
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    List<SeriesModel> tvShows = [];
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

    return SeriesSeasonDetailsModel.fromJson(data);
  }

  @override
  RemoteDataSourceListSeriesEntity fetchAiringTvShows({
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    List<SeriesModel> series = [];
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
