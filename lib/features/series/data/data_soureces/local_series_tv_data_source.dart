import 'package:hive_flutter/hive_flutter.dart';

import '../../../../constant.dart';
import '../../domain/entites/series_entity.dart';

abstract class LocalSeriesTvDataSource {
  Future<List<SeriesEntity>> fetchPopularTvShows({int page = 1});
  Future<List<SeriesEntity>> fetchtTrendingTvShows({int page = 1});
  Future<List<SeriesEntity>> fetchTopRatedTvShows({int page = 1});
}

class LocalSeriesDataSourceImpl extends LocalSeriesTvDataSource {
  @override
  Future<List<SeriesEntity>> fetchPopularTvShows({int page = 1}) async {
    var cachedPopTvShows = Hive.box<SeriesEntity>(popularTvBox);
    return cachedPopTvShows.values.toList();
  }

  @override
  Future<List<SeriesEntity>> fetchTopRatedTvShows({int page = 1}) async {
    var cachedTopRatedTvShows = Hive.box<SeriesEntity>(topRatedBox);
    return cachedTopRatedTvShows.values.toList();
  }

  @override
  Future<List<SeriesEntity>> fetchtTrendingTvShows({int page = 1}) async {
    var cachedTrendigTvShows = Hive.box<SeriesEntity>(trendingTvBox);
    return cachedTrendigTvShows.values.toList();
  }
}
