// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../domain/entities/favorite_entity.dart';
// import '../../../../domain/use_cases/get_favorites_use_case.dart';

// part 'get_favorites_state.dart';

// class GetFavoritesCubit extends Cubit<GetFavoritesState> {
//   GetFavoritesCubit(this.getFavoritesUseCase) : super(GetFavoritesInitial());
//   final GetFavoritesUseCase getFavoritesUseCase;
//   List<WishListEntity> favoritesList = [];
//   StreamSubscription<List<WishListEntity>>? _favoritesSubscription;
//   void getFavoriteItems(String userId) {
//     emit(GetFavoritesLoading());
//     _favoritesSubscription?.cancel();
//     _favoritesSubscription = getFavoritesUseCase
//         .call(userId)
//         .listen(
//           (favorites) {
//             favoritesList = favorites;
//             emit(GetFavoritesSuccess(favorites: favoritesList));
//           },
//           onError: (error) {
//             emit(GetFavoritesFailure(errorMessage: error.toString()));
//           },
//         );
//   }

//   bool isItemoFavorite(int movieId) {
//     return favoritesList.any((movie) {
//       return movie.movieId == movieId;
//     });
//   }

//   @override
//   Future<void> close() {
//     _favoritesSubscription?.cancel();
//     return super.close();
//   }

//   void clearCache() {
//     favoritesList.clear();
//     emit(GetFavoritesSuccess(favorites: favoritesList));
//   }
// }
