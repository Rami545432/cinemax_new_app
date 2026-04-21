import 'package:cinemax_app_new/core/utils/pagination/presentation/cubit/category_pagination_state.dart';
import 'package:cinemax_app_new/features/home/presentation/enums/seires_category.dart';
import 'package:cinemax_app_new/shared/domain/entites/series_entity.dart';

typedef SeriesViewLoaded =
    CategoryPaginationLoaded<SeriesCategory, SeriesEntity, void>;
typedef SeriesViewState =
    CategoryPaginationState<SeriesCategory, SeriesEntity, void>;
