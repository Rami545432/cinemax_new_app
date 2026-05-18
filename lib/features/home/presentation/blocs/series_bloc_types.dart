import 'package:movify/core/domain/use_cases/no_params.dart';
import 'package:movify/core/pagination/presentation/bloc/category_pagination_state.dart';
import 'package:movify/features/home/presentation/enums/seires_category.dart';
import 'package:movify/shared/domain/entites/series_entity.dart';

typedef SeriesBlocState =
    CategoryPaginationState<SeriesCategory, SeriesEntity, NoParams>;
typedef SeriesBlocLoaded =
    CategoryPaginationLoaded<SeriesCategory, SeriesEntity, NoParams>;
