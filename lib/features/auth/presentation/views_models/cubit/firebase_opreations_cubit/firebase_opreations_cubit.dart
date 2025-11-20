// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';

// import '../../../../domain/use_cases/get_current_user_use_case.dart';
// import '../../../../domain/use_cases/check_auth_statues_use_case.dart';

// part 'firebase_opreations_state.dart';

// class FirebaseOpreationsCubit extends Cubit<FirebaseOpreationsState> {
//   FirebaseOpreationsCubit({
//     required this.updateEmailUseCase,
//     required this.updateNameUseCase,
//   }) : super(FirebaseOpreationsInitial());
//   final UpdateEmailUseCase updateEmailUseCase;
//   final UpdateNameUseCase updateNameUseCase;

//   Future<void> updateDisplayName(String name) async {
//     emit(FirebaseOpreationsLoading());
//     final newName = await updateNameUseCase.call(name);
//     newName.fold(
//       (failure) {
//         emit(FirebaseOpreationsFailure(errMessage: failure.errorMessage));
//       },
//       (newName) {
//         emit(FirebaseOpreationsSuccess());
//       },
//     );
//   }

//   Future<void> updateEmail(String email) async {
//     emit(FirebaseOpreationsLoading());
//     final newMail = await updateEmailUseCase.call(email);
//     newMail.fold(
//       (failure) {
//         emit(FirebaseOpreationsFailure(errMessage: failure.errorMessage));
//       },
//       (newMail) {
//         emit(FirebaseOpreationsSuccess());
//       },
//     );
//   }
// }
