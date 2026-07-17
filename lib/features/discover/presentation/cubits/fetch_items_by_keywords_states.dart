import 'package:movify/core/domain/use_cases/no_params.dart';
import 'package:movify/core/pagination/presentation/bloc/category_pagination_state.dart';
import 'package:movify/features/discover/presentation/core/enums/type_enum.dart';
import 'package:movify/shared/presentation/models/card_display_model.dart';

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
