// import 'package:movify/core/errors/errors.dart';
// import 'package:movify/core/types/domain_types.dart';
// import 'package:movify/core/utils/pagination/domain/entites/page_result.dart';
// import 'package:movify/shared/domain/entites/movie_entity.dart';
// import 'package:movify/shared/domain/entites/series_entity.dart';
// import 'package:dartz/dartz.dart';

// abstract class DetailsRepo {
//   MovieDetailsResult fetchMovieDetails(int movieId);
//   SeriesDetailsResult fetchSeriesDetails(int seriesId);
//   SeriesSeasonDetailsResult fetchSeriesSeasonDetails(
//     int seriesId,
//     int seasonNumber,
//   );
//   Future<Either<Failure, PageResult<MovieEntity>>> fetchMoviesRecommendations(
//     int id,
//     int? page,
//   );
//   Future<Either<Failure, PageResult<SeriesEntity>>> fetchSeriesRecommendations(
//     int id,
//     int? page,
//   );
//   Future<Either<Failure, PageResult<MovieEntity>>> fetchMoviesSimilarItems(
//     int id,
//     int? page,
//   );
//   Future<Either<Failure, PageResult<SeriesEntity>>> fetchSeriesSimilarItems(
//     int id,
//     int? page,
//   );
//   CollectionResult fetchCollection(int collectionId);
// }
