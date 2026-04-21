import 'package:cinemax_app_new/core/utils/pagination/presentation/cubit/category_pagination_state.dart';
import 'package:cinemax_app_new/features/home/presentation/enums/movie_category.dart';
import 'package:cinemax_app_new/shared/domain/entites/movie_entity.dart';

typedef HomeViewLoaded =
    CategoryPaginationLoaded<MovieCategory, MovieEntity, void>;
typedef HomeViewState =
    CategoryPaginationState<MovieCategory, MovieEntity, void>;
typedef HomeViewLoading =
    CategoryPaginationLoading<MovieCategory, MovieEntity, void>;
