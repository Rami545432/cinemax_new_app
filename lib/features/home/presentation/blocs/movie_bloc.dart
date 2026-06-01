import 'package:dartz/dartz.dart';
import 'package:movify/core/domain/use_cases/no_params.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/core/pagination/api/config/pagintaion_config.dart';
import 'package:movify/core/pagination/domain/entites/page_result.dart';
import 'package:movify/core/pagination/presentation/bloc/category_pagination_bloc.dart';
import 'package:movify/features/home/domian/use_cases/get_movies_use_case.dart';
import 'package:movify/features/home/presentation/enums/movie_category.dart';
import 'package:movify/shared/domain/entites/movie_entity.dart';

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
