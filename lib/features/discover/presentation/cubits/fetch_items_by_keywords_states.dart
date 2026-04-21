import 'package:cinemax_app_new/core/utils/pagination/presentation/bloc/category_pagination_state.dart';
import 'package:cinemax_app_new/features/discover/presentation/core/enums/type_enum.dart';
import 'package:cinemax_app_new/shared/domain/use_cases/use_case.dart';
import 'package:cinemax_app_new/shared/presentation/models/card_display_model.dart';

typedef FetchItemsByKeywordsLoaded =
    CategoryPaginationLoaded<TypeEnum, CardDisplayModel, NoParams>;
typedef FetchItemsByKeywordsLoading =
    CategoryPaginationLoading<TypeEnum, CardDisplayModel, NoParams>;
typedef FetchItemsByKeywordsState =
    CategoryPaginationState<TypeEnum, CardDisplayModel, NoParams>;
// typedef ModeGridView =
//     CustomSliverGridViewBuilder<
//       FetchItemsByKeywordsCubit,
//       TypeEnum,
//       CardDisplayModel,
//       NoParams
//     >;
