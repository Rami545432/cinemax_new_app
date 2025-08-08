import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/errors/errors.dart';
import '../../../../models/base_card_model.dart';
import '../../../../models/movie_details_model/movie_details_model.dart';
import '../entites/entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<MovieEntity>>> fetchPopularMovies(
    dynamic generId, {
    int page = 1,
    CancelToken? cancelToken,
  });
  Future<Either<Failure, List<MovieEntity>>> fetchUpcomingMovies({
    int page = 1,
    CancelToken? cancelToken,
  });
  Future<Either<Failure, List<MovieEntity>>> fetchTrendingMovies({
    int page = 1,
    CancelToken? cancelToken,
  });
  Future<Either<Failure, List<MovieEntity>>> fetchTopRatedMovies({
    int page = 1,
    CancelToken? cancelToken,
  });
  Future<Either<Failure, List<MovieEntity>>> fetchNowPlayingMovies({
    int page = 1,
    CancelToken? cancelToken,
  });

  Future<Either<Failure, MovieDetailsModel>> fetchMoviesDetails(
    int movieid,
    CancelToken? cancelToken,
  );
  Future<Either<Failure, List<BaseCardModel>>> fetchRecommmendedItems(
    int id,
    String type,
    CancelToken? cancelToken,
  );
}
