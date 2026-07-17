import 'package:movify/core/domain/use_cases/no_params.dart';
import 'package:movify/core/pagination/presentation/bloc/category_pagination_state.dart';
import 'package:movify/features/home/presentation/enums/movie_category.dart';
import 'package:movify/shared/domain/entites/movie_entity.dart';

typedef MovieBlocState =
    CategoryPaginationState<MovieCategory, MovieEntity, NoParams>;
typedef MovieLoadedState =
    CategoryPaginationLoaded<MovieCategory, MovieEntity, NoParams>;
