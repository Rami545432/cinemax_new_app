import 'package:cinemax_app_new/core/utils/pagination/cubit/category_pagination_state.dart';
import 'package:cinemax_app_new/features/home/presentation/cubit/movie_view_cubit.dart';
import 'package:cinemax_app_new/features/home/presentation/cubit/movie_category.dart';
import 'package:cinemax_app_new/core/utils/pagination/widgets/category_see_all_view.dart';
import 'package:cinemax_app_new/core/utils/pagination/widgets/generic_paginated_section.dart.dart';
import 'package:cinemax_app_new/models/base_card_model.dart';

typedef HomePaginatedItem =
    GenericPaginatedSection<MovieViewCubit, MovieCategory, BaseCardModel, void>;
typedef CategoryHomeSeeAllView =
    CategorySeeAllView<MovieViewCubit, MovieCategory, BaseCardModel, void>;
typedef HomeViewLoaded =
    CategoryPaginationLoaded<MovieCategory, BaseCardModel, void>;
typedef HomeViewState =
    CategoryPaginationState<MovieCategory, BaseCardModel, void>;
typedef HomeViewLoading =
    CategoryPaginationLoading<MovieCategory, BaseCardModel, void>;
