import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/entites/series_entity.dart';

abstract class LocalSeriesTvDataSource {
  Future<List<SeriesEntity>> fetchPopularTvShows({int page = 1});
  Future<List<SeriesEntity>> fetchtTrendingTvShows({int page = 1});
  Future<List<SeriesEntity>> fetchTopRatedTvShows({int page = 1});
}

class LocalSeriesDataSourceImpl extends LocalSeriesTvDataSource {
  @override
  Future<List<SeriesEntity>> fetchPopularTvShows({int page = 1}) async {
    var cachedPopTvShows = Hive.box<SeriesEntity>('');
    return cachedPopTvShows.values.toList();
  }

  @override
  Future<List<SeriesEntity>> fetchTopRatedTvShows({int page = 1}) async {
    var cachedTopRatedTvShows = Hive.box<SeriesEntity>('');
    return cachedTopRatedTvShows.values.toList();
  }

  @override
  Future<List<SeriesEntity>> fetchtTrendingTvShows({int page = 1}) async {
    var cachedTrendigTvShows = Hive.box<SeriesEntity>('');
    return cachedTrendigTvShows.values.toList();
  }
}
