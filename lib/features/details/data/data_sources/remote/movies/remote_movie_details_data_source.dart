import 'package:cinemax_app_new/core/utils/pagination/domain/entites/page_result.dart';
import 'package:cinemax_app_new/features/details/data/models/collection_model/collection_model.dart';
import 'package:cinemax_app_new/features/details/data/models/movie_details_model.dart';
import 'package:cinemax_app_new/features/home/data/models/movie_model.dart';

abstract interface class RemoteMovieDetailsDataSource {
  Future<MovieDetailsModel> fetchMovieDetails(int movieId);
  Future<PageResult<MovieModel>> fetchMoviesRecommendations(int id, int? page);
  Future<PageResult<MovieModel>> fetchMoviesSimilar(int id, int? page);
  Future<CollectionModel> fetchMovieCollections(int collectionId);
}
