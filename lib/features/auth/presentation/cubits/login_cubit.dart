import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/core/domain/use_cases/no_params.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/features/auth/domain/use_cases/sign_in_with_google_use_case.dart';
import 'package:movify/features/auth/presentation/cubits/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final SignInWithGoogleUseCase signInWithGoogleUseCase;

  LoginCubit({required this.signInWithGoogleUseCase}) : super(LoginInitial());

  Future<void> signInWithGoogle() async {
    emit(LoginLoading());
    final result = await signInWithGoogleUseCase(NoParams());

    result.fold(
      (failure) {
        if (failure is CancelledFailure) {
          emit(LoginInitial());
          return;
        } else {
          emit(LoginFailure(message: failure.errorMessage));
        }
      },
      (_) {
        emit(LoginSuccess());
      },
    );
  }
}
