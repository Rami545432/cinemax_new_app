import 'package:cinemax_app_new/core/utils/pagination/presentation/bloc/category_pagination_state.dart';
import 'package:cinemax_app_new/features/home/presentation/enums/movie_category.dart';
import 'package:cinemax_app_new/shared/domain/entites/movie_entity.dart';
import 'package:cinemax_app_new/shared/domain/use_cases/use_case.dart';

typedef MovieBlocState =
    CategoryPaginationState<MovieCategory, MovieEntity, NoParams>;
typedef MovieLoadedState =
    CategoryPaginationLoaded<MovieCategory, MovieEntity, NoParams>;
