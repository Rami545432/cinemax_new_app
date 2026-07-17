import 'package:movify/core/pagination/presentation/cubit/category_pagination_state.dart';
import 'package:movify/features/home/presentation/enums/movie_category.dart';
import 'package:movify/shared/domain/entites/movie_entity.dart';

typedef HomeViewLoaded =
    CategoryPaginationLoaded<MovieCategory, MovieEntity, void>;
typedef HomeViewState =
    CategoryPaginationState<MovieCategory, MovieEntity, void>;
typedef HomeViewLoading =
    CategoryPaginationLoading<MovieCategory, MovieEntity, void>;
