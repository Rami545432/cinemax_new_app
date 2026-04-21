// movie_details_repo_impl.dart
import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/core/types/domain_types.dart';
import 'package:cinemax_app_new/core/utils/pagination/domain/entites/page_result.dart';
import 'package:cinemax_app_new/features/details/data/data_sources/remote/movies/remote_movie_details_data_source.dart';
import 'package:cinemax_app_new/features/details/domain/entites/collection_entity.dart';
import 'package:cinemax_app_new/features/details/domain/entites/movie_details_entity.dart';
import 'package:cinemax_app_new/features/details/domain/repo/movie_details_repo.dart';
import 'package:cinemax_app_new/shared/data/cache/in_memory_cache.dart';
import 'package:cinemax_app_new/shared/domain/entites/movie_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: MovieDetailsRepo)
class MovieDetailsRepoImpl implements MovieDetailsRepo {
  final RemoteMovieDetailsDataSource remoteDataSource;

  MovieDetailsRepoImpl({required this.remoteDataSource});

  // Cache is just a field — no boilerplate
  final _detailsCache = InMemoryCache<MovieDetailsEntity>(
    duration: const Duration(minutes: 30),
  );
  final _recommendationsCache = InMemoryCache<PageResult<MovieEntity>>(
    duration: const Duration(minutes: 15),
  );
  final _similarCache = InMemoryCache<PageResult<MovieEntity>>(
    duration: const Duration(minutes: 15),
  );
  final _collectionCache = InMemoryCache<CollectionEntity>(
    duration: const Duration(minutes: 15),
  );

  @override
  MovieDetailsResult fetchMovieDetails(int movieId) async {
    final key = 'movie-$movieId';
    final cached = _detailsCache.get(key); // ← one line, no boilerplate
    if (cached != null) {
      return Right(cached);
    }

    try {
      final data = await remoteDataSource.fetchMovieDetails(movieId);
      final entity = data.toEntity();
      _detailsCache.set(key, entity); // ← one line
      return Right(entity);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  CollectionResult fetchMovieCollections(int collectionId) async {
    final key = 'collection-$collectionId';
    final cached = _collectionCache.get(key);
    if (cached != null) {
      return Right(cached);
    }
    try {
      final data = await remoteDataSource.fetchMovieCollections(collectionId);
      final entity = data.toEntity();
      _collectionCache.set(key, entity);
      return Right(entity);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PageResult<MovieEntity>>> fetchMoviesRecommendations(
    int id,
    int? page,
  ) async {
    final key = 'recommendations-$id-$page';
    final cached = _recommendationsCache.get(key);
    if (cached != null) {
      return Right(cached);
    }
    try {
      final data = await remoteDataSource.fetchMoviesRecommendations(id, page);
      final entity = data.map((e) => e.toEntity());
      _recommendationsCache.set(key, entity);
      return Right(entity);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PageResult<MovieEntity>>> fetchMoviesSimilarItems(
    int id,
    int? page,
  ) async {
    final key = 'similar-$id-$page';
    final cached = _similarCache.get(key);
    if (cached != null) {
      return Right(cached);
    }
    try {
      final data = await remoteDataSource.fetchMoviesSimilar(id, page);
      final entity = data.map((e) => e.toEntity());
      _similarCache.set(key, entity);
      return Right(entity);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
