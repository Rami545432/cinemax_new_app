import 'package:cinemax_app_new/core/types/domain_types.dart';

abstract interface class HomeRepo {
  MovieListResult getMovies({int page = 1, String endPoint = 'popular'});
  SeriesListResult getTvShows({int page = 1, String endPoint = 'popular'});
}
