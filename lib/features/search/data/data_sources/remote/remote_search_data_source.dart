import 'package:cinemax_app_new/features/home/data/models/movie_model.dart';
import 'package:cinemax_app_new/features/home/data/models/series_model.dart';
import 'package:cinemax_app_new/features/search/data/models/search_actor_model/search_actor_model.dart';

abstract interface class RemoteSearchDataSource {
  Future<List<MovieModel>> searchMovies(String query);

  Future<List<SearchActorModel>> searchActors(String query);
  Future<List<SeriesModel>> searchSeries(String query);
}
