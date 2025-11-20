import '../../features/auth/domain/entities/user_entity.dart';
import '../../features/home/domian/entites/movie_entity.dart';
import '../../features/details/domain/entites/movie_details_entity.dart';
import '../../features/series/domain/entites/series_entity.dart';
import '../../features/details/domain/entites/series_details_entity.dart';
import '../../features/details/domain/entites/series_season_details_entitiy.dart';
import '../../models/base_card_model.dart';
import 'repository_types.dart';

typedef MovieResult = RepositoryResult<MovieEntity>;
typedef MovieListResult = ListRepositoryResult<MovieEntity>;
typedef MovieDetailsResult = RepositoryResult<MovieDetailsEntity>;

/// Series domain types
typedef SeriesResult = RepositoryResult<SeriesEntity>;
typedef SeriesListResult = ListRepositoryResult<SeriesEntity>;
typedef SeriesDetailsResult = RepositoryResult<SeriesDetailsEntity>;
typedef SeriesSeasonDetailsResult =
    RepositoryResult<SeriesSeasonDetailsEntitiy>;

/// Auth domain types
typedef AuthResult = RepositoryResult<UserEntity>;

/// Search & recommendations
typedef RecommendationResult = RepositoryResult<List<BaseCardModel>>;
typedef SimilarItemsResult = RepositoryResult<List<BaseCardModel>>;
