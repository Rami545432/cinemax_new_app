import 'package:cinemax_app_new/shared/domain/entites/movie_entity.dart';
import 'package:cinemax_app_new/shared/domain/entites/series_entity.dart';

sealed class SearchResult {}

class MovieResult extends SearchResult {
  final MovieEntity movie;
  MovieResult(this.movie);
}

class TvShowResult extends SearchResult {
  final SeriesEntity tvShow;
  TvShowResult(this.tvShow);
}
