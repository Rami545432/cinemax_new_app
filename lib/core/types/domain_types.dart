import 'package:cinemax_app_new/features/details/domain/entites/collection_entity.dart';
import 'package:cinemax_app_new/features/home/data/models/test_model.dart';

import '../../features/auth/domain/entities/user_entity.dart';
import '../../features/home/domian/entites/movie_entity.dart';
import '../../features/details/domain/entites/movie_details_entity.dart';
import '../../features/home/domian/entites/series_entity.dart';
import '../../features/details/domain/entites/series_details_entity.dart';
import '../../features/details/domain/entites/series_season_details_entitiy.dart';
import '../../models/base_card_model.dart';
import 'repository_types.dart';

typedef MovieResult = RepositoryResult<MovieEntity>;
typedef MovieListResult = RepositoryResult<PagedResult<MovieEntity>>;
typedef MovieDetailsResult = RepositoryResult<MovieDetailsEntity>;

/// Series domain types
typedef SeriesResult = RepositoryResult<SeriesEntity>;
typedef SeriesListResult = RepositoryResult<PagedResult<SeriesEntity>>;
typedef SeriesDetailsResult = RepositoryResult<SeriesDetailsEntity>;
typedef SeriesSeasonDetailsResult =
    RepositoryResult<SeriesSeasonDetailsEntitiy>;

/// Auth domain types
typedef AuthResult = RepositoryResult<UserEntity>;

/// Search & recommendations
typedef RecommendationResult = RepositoryResult<PagedResult<BaseCardModel>>;
typedef SimilarItemsResult = RepositoryResult<PagedResult<BaseCardModel>>;
typedef CollectionResult = RepositoryResult<CollectionEntity>;
