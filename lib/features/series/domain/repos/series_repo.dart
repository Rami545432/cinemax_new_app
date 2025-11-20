import 'package:cinemax_app_new/core/types/domain_types.dart';
import 'package:dio/dio.dart';

abstract class SeriesRepo {
  SeriesListResult fetchTrendingTvShows({
    int page = 1,
    CancelToken? cancelToken,
  });
  SeriesListResult fetchPopularTvShows(
    dynamic generId, {
    int page = 1,
    CancelToken? cancelToken,
  });
  SeriesListResult fetchTopRatedTvShows({
    int page = 1,
    CancelToken? cancelToken,
  });

  SeriesListResult fetchTvAiringToday({int page = 1, CancelToken? cancelToken});
}
