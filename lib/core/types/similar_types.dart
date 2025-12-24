import 'package:cinemax_app_new/core/utils/pagination/cubit/category_pagination_state.dart';
import 'package:cinemax_app_new/features/details/domain/enums/similar_category.dart';
import 'package:cinemax_app_new/features/details/domain/use_cases/fetch_similar_use_case.dart';
import 'package:cinemax_app_new/features/details/presentation/cubits/fetch_similar_cubit.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/shared/custom_grid_view_builder.dart';
import 'package:cinemax_app_new/models/base_card_model.dart';

typedef SimilarGridView =
    CustomGridView<
      FetchSimilarCubit,
      SimilarCategory,
      BaseCardModel,
      SimilarParams
    >;
typedef SimilarStateLoaded =
    CategoryPaginationLoaded<SimilarCategory, BaseCardModel, void>;
