import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/pagination/api/config/pagintaion_config.dart';
import 'package:cinemax_app_new/core/utils/pagination/domain/entites/page_result.dart';
import 'package:cinemax_app_new/core/utils/pagination/presentation/bloc/category_pagination_bloc.dart';
import 'package:cinemax_app_new/features/home/domian/use_cases/get_movies_use_case.dart';
import 'package:cinemax_app_new/features/home/presentation/enums/movie_category.dart';
import 'package:cinemax_app_new/shared/domain/entites/movie_entity.dart';
import 'package:cinemax_app_new/shared/domain/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class MovieBloc
    extends CategoryPaginationBloc<MovieCategory, MovieEntity, NoParams> {
  final GetMoviesUseCase getMoviesUseCase;

  MovieBloc({required this.getMoviesUseCase}) : super(PaginationConfig());

  @override
  List<MovieCategory> get allCategories => MovieCategory.values;

  @override
  Future<Either<Failure, PageResult<MovieEntity>>> fetchCategoryData(
    MovieCategory category,
    int page,
    NoParams? params,
  ) => getMoviesUseCase(page: page, endPoint: category.endPoint);
}
