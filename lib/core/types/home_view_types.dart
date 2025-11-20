import 'package:cinemax_app_new/core/utils/pagination/cubit/category_pagination_state.dart';
import 'package:cinemax_app_new/features/home/presentation/cubit/home_view_cubit.dart';
import 'package:cinemax_app_new/features/home/presentation/cubit/movie_category.dart';
import 'package:cinemax_app_new/features/home/presentation/views_models/views/category_see_all_view.dart';
import 'package:cinemax_app_new/core/utils/pagination/widgets/generic_paginated_section.dart.dart';
import 'package:cinemax_app_new/models/base_card_model.dart';

typedef HomePaginatedItem =
    GenericPaginatedSection<HomeViewCubit, MovieCategory, BaseCardModel, void>;
typedef CategoryHomeSeeAllView =
    CategorySeeAllView<HomeViewCubit, MovieCategory, BaseCardModel, void>;
typedef HomeViewLoaded = CategoryPaginationLoaded<MovieCategory, BaseCardModel>;
typedef HomeViewState = CategoryPaginationState<MovieCategory, BaseCardModel>;
typedef HomeViewLoading =
    CategoryPaginationLoading<MovieCategory, BaseCardModel>;
