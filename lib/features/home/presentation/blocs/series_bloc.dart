import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/pagination/api/config/pagintaion_config.dart';
import 'package:cinemax_app_new/core/utils/pagination/domain/entites/page_result.dart';
import 'package:cinemax_app_new/core/utils/pagination/presentation/bloc/category_pagination_bloc.dart';
import 'package:cinemax_app_new/features/home/domian/use_cases/get_series_use_case.dart';
import 'package:cinemax_app_new/features/home/presentation/enums/seires_category.dart';
import 'package:cinemax_app_new/shared/domain/entites/series_entity.dart';
import 'package:cinemax_app_new/shared/domain/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
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
