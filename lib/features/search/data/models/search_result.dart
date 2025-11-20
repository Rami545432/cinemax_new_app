import 'package:cinemax_app_new/features/series/domain/entites/series_entity.dart';

import '../../../home/domian/entites/movie_entity.dart';

sealed class SearchResult {}

class MovieResult extends SearchResult {
  final MovieEntity movie;
  MovieResult(this.movie);
}

class TvShowResult extends SearchResult {
  final SeriesEntity tvShow;
  TvShowResult(this.tvShow);
}
