import 'package:dartz/dartz.dart';
import 'package:movify/core/domain/use_cases/no_params.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/core/pagination/api/config/pagintaion_config.dart';
import 'package:movify/core/pagination/domain/entites/page_result.dart';
import 'package:movify/core/pagination/presentation/bloc/category_pagination_bloc.dart';
import 'package:movify/features/home/domian/use_cases/get_series_use_case.dart';
import 'package:movify/features/home/presentation/enums/seires_category.dart';
import 'package:movify/shared/domain/entites/series_entity.dart';

class SeriesBloc
    extends CategoryPaginationBloc<SeriesCategory, SeriesEntity, NoParams> {
  final GetSeriesUseCase getSeriesUseCase;

  SeriesBloc({required this.getSeriesUseCase}) : super(PaginationConfig());

  @override
  List<SeriesCategory> get allCategories => SeriesCategory.values;

  @override
  Future<Either<Failure, PageResult<SeriesEntity>>> fetchCategoryData(
    SeriesCategory category,
    int page,
    NoParams? params,
  ) => getSeriesUseCase(page: page, endPoint: category.endPoint);
}
