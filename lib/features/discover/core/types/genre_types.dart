import 'package:cinemax_app_new/features/discover/data/models/genre_filter.dart';
import 'package:cinemax_app_new/features/discover/presentation/cubit/genre_content_cubit.dart';
import 'package:cinemax_app_new/core/utils/pagination/widgets/category_see_all_view.dart';
import 'package:cinemax_app_new/models/base_card_model.dart';

typedef GenreSeeAllView =
    CategorySeeAllView<
      GenreContentCubit,
      GenreCategory,
      BaseCardModel,
      GenreFilterParams
    >;
