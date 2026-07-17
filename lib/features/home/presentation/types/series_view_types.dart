import 'package:movify/core/pagination/presentation/cubit/category_pagination_state.dart';
import 'package:movify/features/home/presentation/enums/seires_category.dart';
import 'package:movify/shared/domain/entites/series_entity.dart';

typedef SeriesViewLoaded =
    CategoryPaginationLoaded<SeriesCategory, SeriesEntity, void>;
typedef SeriesViewState =
    CategoryPaginationState<SeriesCategory, SeriesEntity, void>;
