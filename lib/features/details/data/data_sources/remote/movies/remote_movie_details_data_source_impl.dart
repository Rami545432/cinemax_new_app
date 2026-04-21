import 'package:cinemax_app_new/core/network/api/services/api_service.dart';
import 'package:cinemax_app_new/core/utils/pagination/domain/entites/page_result.dart';
import 'package:cinemax_app_new/features/details/data/data_sources/remote/movies/remote_movie_details_data_source.dart';
import 'package:cinemax_app_new/features/details/data/models/collection_model/collection_model.dart';
import 'package:cinemax_app_new/features/details/data/models/movie_details_model.dart';
import 'package:cinemax_app_new/features/home/data/models/movie_model.dart';
import 'package:cinemax_app_new/shared/data/mappers/map_paged_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: RemoteMovieDetailsDataSource)
class RemoteMovieDetailsDataSourceImpl implements RemoteMovieDetailsDataSource {
  final ApiService apiService;
  RemoteMovieDetailsDataSourceImpl({required this.apiService});
  @override
  Future<MovieDetailsModel> fetchMovieDetails(int movieId) async {
    final data = await apiService.tmdb.details.getDetails(
      id: movieId,
      type: 'movie',
    );
    if (data['overview'] == '') {
      data['overview'] =
          data['translations']['translations'][0]['data']['overview'];
    }
    return MovieDetailsModel.fromJson(data);
  }

  @override
  Future<PageResult<MovieModel>> fetchMoviesRecommendations(
    int id,
    int? page,
  ) async {
    final data = await apiService.tmdb.details.getRecommendations(
      id: id,
      type: 'movie',
      page: page,
    );
    return mapPagedResponse(
      data: data,
      fromJson: (json) => MovieModel.fromJson(json),
    );
  }

  @override
  Future<PageResult<MovieModel>> fetchMoviesSimilar(int id, int? page) async {
    final data = await apiService.tmdb.details.getSimilar(
      id: id,
      type: 'movie',
      page: page ?? 1,
    );
    return mapPagedResponse(
      data: data,
      fromJson: (json) => MovieModel.fromJson(json),
    );
  }

  @override
  Future<CollectionModel> fetchMovieCollections(int collectionId) async {
    final data = await apiService.tmdb.details.getCollection(id: collectionId);
    return CollectionModel.fromJson(data);
  }
}
