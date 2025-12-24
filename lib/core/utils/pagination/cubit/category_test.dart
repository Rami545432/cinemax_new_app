// import 'package:cinemax_app_new/core/network/utils/safe_emit_state.dart';
// import 'package:cinemax_app_new/core/utils/errors/errors.dart';
// import 'package:cinemax_app_new/core/utils/pagination/cubit/category_pagination_state.dart';
// import 'package:cinemax_app_new/core/utils/pagination/config/pagination_info.dart';
// import 'package:cinemax_app_new/core/utils/pagination/config/pagintaion_config.dart';
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// /// CAT = Category enum type
// /// T = Item/Entity type
// /// P = Parameters type

// abstract class CategoryPaginationCubit<CAT, T, P>
//     extends Cubit<CategoryPaginationState<CAT, T>> {
//   final PaginationConfig config;
//   final Map<CAT, CancelToken> _cancelTokens = {};
//   CategoryPaginationCubit(this.config)
//     : super(CategoryPaginationInitial<CAT, T>());
//   Future<Either<Failure, List<T>>> fetchCategoryData(
//     CAT category,
//     int page,
//     CancelToken? cancelToken,
//   );

//   List<CAT> get allCategories;
//   void initialize() {
//     final initialData = <CAT, PaginationInfo<T>>{};
//     for (var category in allCategories) {
//       initialData[category] = PaginationInfo<T>();
//     }
//     safeEmit(CategoryPaginationLoaded<CAT, T>(categoriesData: initialData));
//   }

//   Future<void> loadCategory(CAT category) async {
//     final currentState = state;
//     if (currentState is! CategoryPaginationLoaded<CAT, T>) {
//       initialize();
//       return loadCategory(category);
//     }
//     final currentInfo = currentState.getPaginationInfo(category);
//     if (currentInfo.isFetching) {
//       return;
//     }
//     _cancelTokens[category]?.cancel();
//     _cancelTokens[category] = CancelToken();
//     safeEmit(
//       currentState.copyWithCategory(
//         category: category,
//         paginationInfo: currentInfo.copyWith(isFetching: true, error: null),
//       ),
//     );
//     try {
//       final result = await fetchCategoryData(
//         category,
//         1,
//         _cancelTokens[category],
//       );
//       result.fold(
//         (failure) {
//           final updatedState = state as CategoryPaginationLoaded<CAT, T>;
//           safeEmit(
//             updatedState.copyWithCategory(
//               category: category,
//               paginationInfo: currentInfo.copyWith(
//                 error: failure.errorMessage,
//                 isFetching: false,
//               ),
//             ),
//           );
//         },
//         (newItems) {
//           final updatedState = state as CategoryPaginationLoaded<CAT, T>;
//           safeEmit(
//             updatedState.copyWithCategory(
//               category: category,
//               paginationInfo: currentInfo.copyWith(
//                 items: newItems,
//                 isFetching: false,
//                 currentPage: 1,
//                 isLastPage:
//                     newItems.isEmpty || newItems.length < config.itemsPerPage,
//               ),
//             ),
//           );
//         },
//       );
//     } catch (e) {
//       if (e is! DioException || !CancelToken.isCancel(e)) {
//         final updatedState = state as CategoryPaginationLoaded<CAT, T>;
//         safeEmit(
//           updatedState.copyWithCategory(
//             category: category,
//             paginationInfo: currentInfo.copyWith(
//               isFetching: false,
//               error: e.toString(),
//             ),
//           ),
//         );
//       }
//     }
//   }

//   Future<void> loadNextPage(CAT category) async {
//     final currentState = state;
//     if (currentState is! CategoryPaginationLoaded<CAT, T>) return;
//     final currentInfo = currentState.getPaginationInfo(category);
//     if (!currentInfo.canLoadMore) return;
//     final nextPage = currentInfo.currentPage + 1;
//     _cancelTokens[category]?.cancel();
//     _cancelTokens[category] = CancelToken();
//     safeEmit(
//       currentState.copyWithCategory(
//         category: category,
//         paginationInfo: currentInfo.copyWith(isFetching: true, error: null),
//       ),
//     );
//     try {
//       final result = await fetchCategoryData(
//         category,
//         nextPage,
//         _cancelTokens[category],
//       );
//       result.fold(
//         (failure) {
//           final updatedState = state as CategoryPaginationLoaded<CAT, T>;
//           safeEmit(
//             updatedState.copyWithCategory(
//               category: category,
//               paginationInfo: currentInfo.copyWith(
//                 error: failure.errorMessage,
//                 isFetching: false,
//               ),
//             ),
//           );
//         },
//         (newItems) {
//           final updatedState = state as CategoryPaginationLoaded<CAT, T>;
//           safeEmit(
//             updatedState.copyWithCategory(
//               category: category,
//               paginationInfo: currentInfo.copyWith(
//                 items: [...currentInfo.items, ...newItems],
//                 isFetching: false,
//                 currentPage: nextPage,
//                 isLastPage:
//                     newItems.isEmpty || newItems.length < config.itemsPerPage,
//               ),
//             ),
//           );
//         },
//       );
//     } catch (e) {
//       if (e is! DioException || !CancelToken.isCancel(e)) {
//         final updatedState = state as CategoryPaginationLoaded<CAT, T>;
//         safeEmit(
//           updatedState.copyWithCategory(
//             category: category,
//             paginationInfo: currentInfo.copyWith(
//               error: e.toString(),
//               isFetching: false,
//             ),
//           ),
//         );
//       }
//     }
//   }

//   Future<void> refreshCategory(CAT category) async {
//     final currentState = state;
//     if (currentState is! CategoryPaginationLoaded<CAT, T>) return;

//     safeEmit(
//       currentState.copyWithCategory(
//         category: category,
//         paginationInfo: PaginationInfo<T>(),
//       ),
//     );

//     await loadCategory(category);
//   }

//   /// Load all categories in parallel
//   Future<void> loadAllCategories() async {
//     safeEmit(CategoryPaginationLoading<CAT, T>());
//     initialize();
//     await Future.wait(allCategories.map((category) => loadCategory(category)));
//   }

//   /// Refresh all categories
//   Future<void> refreshAllCategories() async {
//     await loadAllCategories();
//   }

//   @override
//   Future<void> close() {
//     for (var token in _cancelTokens.values) {
//       token.cancel();
//     }
//     return super.close();
//   }
// }
