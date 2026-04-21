import 'package:cinemax_app_new/core/types/repository_types.dart';
import 'package:cinemax_app_new/core/utils/pagination/domain/entites/page_result.dart';
import 'package:cinemax_app_new/features/auth/domain/entities/user_entity.dart';
import 'package:cinemax_app_new/features/details/domain/entites/collection_entity.dart';
import 'package:cinemax_app_new/features/details/domain/entites/movie_details_entity.dart';
import 'package:cinemax_app_new/features/details/domain/entites/series_details_entity.dart';
import 'package:cinemax_app_new/features/details/domain/entites/series_season_details_entitiy.dart';
import 'package:cinemax_app_new/shared/domain/entites/movie_entity.dart';
import 'package:cinemax_app_new/shared/domain/entites/series_entity.dart';

typedef MovieResult = RepositoryResult<MovieEntity>;
typedef MovieListResult = RepositoryResult<PageResult<MovieEntity>>;
typedef MovieDetailsResult = RepositoryResult<MovieDetailsEntity>;

/// Series domain types
typedef SeriesResult = RepositoryResult<SeriesEntity>;
typedef SeriesListResult = RepositoryResult<PageResult<SeriesEntity>>;
typedef SeriesDetailsResult = RepositoryResult<SeriesDetailsEntity>;
typedef SeriesSeasonDetailsResult = RepositoryResult<SeriesSeasonDetailsEntity>;

/// Auth domain types
typedef AuthResult = RepositoryResult<UserEntity>;


typedef CollectionResult = RepositoryResult<CollectionEntity>;
