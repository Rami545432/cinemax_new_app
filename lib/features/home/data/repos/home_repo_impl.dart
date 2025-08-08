import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/errors/errors.dart';
import '../../../../models/base_card_model.dart';
import '../../../../models/movie_details_model/movie_details_model.dart';
import '../../domian/entites/entity.dart';
import '../../domian/repos/home_repo.dart';
import '../data_soureces/local_home_data_source.dart';
import '../data_soureces/remote_home_data_source.dart';

class HomeRepoImpl implements HomeRepo {
  final RemoteHomeDataSource remoteHomeDataSource;
  final LocalHomeDataSource localHomeDataSource;

  HomeRepoImpl({
    required this.remoteHomeDataSource,
    required this.localHomeDataSource,
  });
  @override
  Future<Either<Failure, List<MovieEntity>>> fetchPopularMovies(
    dynamic generId, {
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    try {
      // if (cachedMovies.isNotEmpty) {
      //   return right(cachedMovies);
      // }
      var movies = await remoteHomeDataSource.fetchPopularMovies(
        generId,
        page: page,
        cancelToken: cancelToken,
      );
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        ServerFailure.fromDioError(e);
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> fetchUpcomingMovies({
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    try {
      // var cachedMovies = localHomeDataSource.fetchNewsetMovies();
      // if (cachedMovies.isNotEmpty) {
      //   return right(cachedMovies);
      // }
      var movie = await remoteHomeDataSource.fetchUpcomingMovies(
        page: page,
        cancelToken: cancelToken,
      );
      return right(movie);
    } catch (e) {
      if (e is DioException) {
        ServerFailure.fromDioError(e);
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MovieDetailsModel>> fetchMoviesDetails(
    int movieid,
    CancelToken? cancelToken,
  ) async {
    try {
      var movies = await remoteHomeDataSource.fetchMovieDetails(
        movieid,
        cancelToken,
      );
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        ServerFailure.fromDioError(e);
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> fetchTopRatedMovies({
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    try {
      var movies = await remoteHomeDataSource.fetchTopRatedMovies(
        page: page,
        cancelToken: cancelToken,
      );
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> fetchTrendingMovies({
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    try {
      var movies = await remoteHomeDataSource.fetchTrendingMovies(
        page: page,
        cancelToken: cancelToken,
      );
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> fetchNowPlayingMovies({
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    try {
      var movies = await remoteHomeDataSource.fetchNowPlayingMovies(
        page: page,
        cancelToken: cancelToken,
      );
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BaseCardModel>>> fetchRecommmendedItems(
    int id,
    String type,
    CancelToken? cancelToken,
  ) async {
    try {
      // var cachedMovies = localSearchDataSource.recommendedMovies();
      // if (cachedMovies.isNotEmpty) {
      //   return right(cachedMovies);
      // }
      var results = await remoteHomeDataSource.fetchRecommmendedItems(
        id,
        type,
        cancelToken,
      );
      return right(results);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
