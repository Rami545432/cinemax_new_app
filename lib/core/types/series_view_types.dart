import 'package:cinemax_app_new/core/utils/pagination/cubit/category_pagination_state.dart';
import 'package:cinemax_app_new/core/utils/pagination/widgets/generic_paginated_section.dart.dart';
import 'package:cinemax_app_new/features/home/presentation/views_models/views/category_see_all_view.dart';
import 'package:cinemax_app_new/features/series/presentation/cubit/seires_category.dart';
import 'package:cinemax_app_new/features/series/presentation/cubit/series_view_cubit.dart';
import 'package:cinemax_app_new/models/base_card_model.dart';

typedef SeriesPaginatedItem =
    GenericPaginatedSection<
      SeriesViewCubit,
      SeriesCategory,
      BaseCardModel,
      void
    >;
typedef CategorySeriesSeeAllView =
    CategorySeeAllView<SeriesViewCubit, SeriesCategory, BaseCardModel, void>;
typedef SeriesViewLoaded =
    CategoryPaginationLoaded<SeriesCategory, BaseCardModel>;
typedef SeriesViewState =
    CategoryPaginationState<SeriesCategory, BaseCardModel>;
