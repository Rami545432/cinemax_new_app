// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';

// import '../../../../domain/entities/favorite_entity.dart';
// import '../../../../domain/use_cases/delete_wish_case_use_case.dart';

// part 'delete_wish_list_state.dart';

// class DeleteWishListCubit extends Cubit<DeleteWishListState> {
//   DeleteWishListCubit(this.deleteWishCaseUseCase)
//     : super(DeleteWishListInitial());
//   final DeleteWishCaseUseCase deleteWishCaseUseCase;
//   Future<void> deleteWish(int movieId) async {
//     try {
//       await deleteWishCaseUseCase.call(movieId);
//     } catch (e) {
//       emit(DeleteWishListFailure(errorMessage: e.toString()));
//     }
//   }
// }
