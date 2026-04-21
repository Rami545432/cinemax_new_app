import 'package:cinemax_app_new/core/utils/pagination/domain/entites/page_result.dart';
import 'package:cinemax_app_new/features/details/data/models/series_details_model.dart';
import 'package:cinemax_app_new/features/details/data/models/series_season_details_model.dart';
import 'package:cinemax_app_new/features/home/data/models/series_model.dart';

abstract interface class RemoteSeriesDetailsDataSource {
  Future<SeriesDetailsModel> fetchSeriesDetails(int seriesId);
  Future<SeriesSeasonDetailsModel> fetchSeriesSeasonDetails(
    int seriesId,
    int seasonNumber,
  );
  Future<PageResult<SeriesModel>> fetchSeriesRecommendations(int id, int? page);
  Future<PageResult<SeriesModel>> fetchSeriesSimilar(int id, int? page);
}
