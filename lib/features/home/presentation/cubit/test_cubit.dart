// import 'package:cinemax_app_new/core/utils/cubit_parameters/popular_params.dart';
// import 'package:cinemax_app_new/core/utils/errors/errors.dart';
// import 'package:cinemax_app_new/core/utils/pagination/config/pagintaion_config.dart';
// import 'package:cinemax_app_new/core/utils/pagination/cubit/category_pagination_cubit.dart';
// import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
// import 'package:cinemax_app_new/features/home/data/models/test_model.dart';
// import 'package:cinemax_app_new/features/home/domian/entites/movie_entity.dart';
// import 'package:cinemax_app_new/features/home/domian/uses_cases/fetch_popular_use_case.dart';
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';

// class TestCubit
//     extends
//         CategoryPaginationCubit<void, PagedResult<MovieEntity>, PopularParams> {
//   final FetchPopularUseCase fetchPopularUseCase;
//   TestCubit({required this.fetchPopularUseCase})
//     : super(PaginationConfig(itemsPerPage: 20));
//   @override
//   List<void> get allCategories => [];
//   @override
//   Future<Either<Failure, PagedResult<MovieEntity>>> fetchCategoryData(
//     void category,
//     int page,
//     PopularParams? params,
//     CancelToken? cancelToken,
//   ) async {
//     return await fetchPopularUseCase.call(
//       PopularParams(type: 'movie'),
//       page,
//       cancelToken,
//     );
//   }
// }
