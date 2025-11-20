import 'package:cinemax_app_new/core/utils/pagination/cubit/category_pagination_state.dart';
import 'package:cinemax_app_new/features/details/domain/enums/recomended_category.dart';
import 'package:cinemax_app_new/features/details/domain/use_cases/fetch_recommended_use_case.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/shared/custom_grid_view_builder.dart';
import 'package:cinemax_app_new/features/home/presentation/cubit/recommended_movies_cubit/recommended_cubit.dart';
import 'package:cinemax_app_new/models/base_card_model.dart';

typedef RecomendedGridView =
    CustomGridView<
      FetchRecommendedCubit,
      RecomendedCategory,
      BaseCardModel,
      RecomendedParams
    >;
typedef RecomendedStateLoaded =
    CategoryPaginationLoaded<RecomendedCategory, BaseCardModel>;
