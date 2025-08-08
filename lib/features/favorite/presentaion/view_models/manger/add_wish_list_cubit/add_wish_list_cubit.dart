// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';

// import '../../../../domain/use_cases/add_wish_list_use_case.dart';

// part 'add_wish_list_state.dart';

// class AddWishListCubit extends Cubit<AddWishListState> {
//   AddWishListCubit(this.addWishListUseCase) : super(AddWishListInitial());
//   final AddWishListUseCase addWishListUseCase;
//   Future<void> addWish(
//     int movieId,
//     String title,
//     String imageUrl,
//     String genre,
//     String type,
//     String userId,
//   ) async {
//     emit(AddWishLoading());
//     try {
//       await addWishListUseCase.call(
//         movieId,
//         title,
//         imageUrl,
//         genre,
//         type,
//         userId,
//       );
//       emit(AddWishSuccess());
//     } catch (e) {
//       emit(AddWishfailure(errorMessage: e.toString()));
//     }
//   }
// }
