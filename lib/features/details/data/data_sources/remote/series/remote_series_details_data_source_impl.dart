import 'package:cinemax_app_new/core/network/api/services/api_service.dart';
import 'package:cinemax_app_new/core/utils/pagination/domain/entites/page_result.dart';
import 'package:cinemax_app_new/features/details/data/data_sources/remote/series/remote_series_details_data_source.dart';
import 'package:cinemax_app_new/features/details/data/models/series_details_model.dart';
import 'package:cinemax_app_new/features/details/data/models/series_season_details_model.dart';
import 'package:cinemax_app_new/features/home/data/models/series_model.dart';
import 'package:cinemax_app_new/shared/data/mappers/map_paged_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: RemoteSeriesDetailsDataSource)
class RemoteSeriesDetailsDataSourceImpl
    implements RemoteSeriesDetailsDataSource {
  final ApiService apiService;
  RemoteSeriesDetailsDataSourceImpl({required this.apiService});
  @override
  Future<SeriesDetailsModel> fetchSeriesDetails(int seriesId) async {
    final data = await apiService.tmdb.details.getDetails(
      id: seriesId,
      type: 'tv',
    );
    if (data['overview'] == '') {
      data['overview'] =
          data['translations']['translations'][0]['data']['overview'];
    }
    return SeriesDetailsModel.fromJson(data);
  }

  @override
  Future<SeriesSeasonDetailsModel> fetchSeriesSeasonDetails(
    int seriesId,
    int seasonNumber,
  ) async {
    final data = await apiService.tmdb.details.getSeasonDetails(
      tvid: seriesId,
      season: seasonNumber,
    );
    return SeriesSeasonDetailsModel.fromJson(data);
  }

  @override
  Future<PageResult<SeriesModel>> fetchSeriesRecommendations(
    int id,
    int? page,
  ) async {
    final data = await apiService.tmdb.details.getRecommendations(
      id: id,
      type: 'tv',
      page: page,
    );
    return mapPagedResponse(
      data: data,
      fromJson: (json) => SeriesModel.fromJson(json),
    );
  }

  @override
  Future<PageResult<SeriesModel>> fetchSeriesSimilar(int id, int? page) async {
    final data = await apiService.tmdb.details.getSimilar(
      id: id,
      type: 'tv',
      page: page ?? 1,
    );
    return mapPagedResponse(
      data: data,
      fromJson: (json) => SeriesModel.fromJson(json),
    );
  }
}
