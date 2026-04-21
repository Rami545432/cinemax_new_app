import 'package:cinemax_app_new/core/utils/pagination/presentation/bloc/category_pagination_state.dart';
import 'package:cinemax_app_new/features/home/presentation/enums/seires_category.dart';
import 'package:cinemax_app_new/shared/domain/entites/series_entity.dart';
import 'package:cinemax_app_new/shared/domain/use_cases/use_case.dart';

typedef SeriesBlocState =
    CategoryPaginationState<SeriesCategory, SeriesEntity, NoParams>;
typedef SeriesBlocLoaded =
    CategoryPaginationLoaded<SeriesCategory, SeriesEntity, NoParams>;
