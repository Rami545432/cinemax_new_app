import 'package:cinemax_app_new/core/types/domain_types.dart';
import 'package:dio/dio.dart';

abstract class DetailsRepo {
  MovieDetailsResult fetchMovieDetails(int movieId, CancelToken? cancelToken);
  SeriesDetailsResult fetchSeriesDetails(
    int seriesId,
    CancelToken? cancelToken,
  );
  SeriesSeasonDetailsResult fetchSeriesSeasonDetails(
    int seriesId,
    int seasonNumber,
    CancelToken? cancelToken,
  );
  RecommendationResult fetchRecommendations(
    int id,
    String type,
    int? page,
    CancelToken? cancelToken,
  );
  SimilarItemsResult fetchSimilarItems(
    int id,
    String type,
    int? page,
    CancelToken? cancelToken,
  );
  CollectionResult fetchCollection(int collectionId, CancelToken? cancelToken);
}
