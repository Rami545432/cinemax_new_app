// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';

// import '../../../../domain/entities/user_entity.dart';
// import '../../../../domain/use_cases/sign_up_with_email_use_case.dart';

// part 'sign_up_state.dart';

// class SignUpCubit extends Cubit<SignUpState> {
//   SignUpCubit(this.signUpUseCase) : super(SignUpInitial());
//   final SignUpWithEmailUseCase signUpUseCase;
//   Future<void> signUp({required String email, required String password}) async {
//     var authOperation = await signUpUseCase.call(email, password);
//     authOperation.fold(
//       (failure) {
//         emit(SignUpFailure(errorMessage: failure.errorMessage));
//       },
//       (authOperation) {
//         emit(SignUpSuccess(userData: authOperation));
//       },
//     );
//   }
// }
