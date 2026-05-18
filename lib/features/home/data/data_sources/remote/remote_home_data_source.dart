import 'package:movify/core/types/data_source_types.dart';

abstract interface class RemoteHomeDataSource {
  RemoteDataSourceListMovieModel getMovies({
    int page = 1,
    String endPoint = 'popular',
  });
  RemoteDataSourceListSeriesModel getTvShows({
    int page = 1,
    String endPoint = 'popular',
  });
}
