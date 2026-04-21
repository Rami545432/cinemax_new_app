import 'package:cinemax_app_new/features/auth/domain/use_cases/sign_in_with_google_use_case.dart';
import 'package:cinemax_app_new/features/auth/presentation/cubits/login_state.dart';
import 'package:cinemax_app_new/shared/domain/use_cases/use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final SignInWithGoogleUseCase signInWithGoogleUseCase;

  LoginCubit({
    required this.signInWithGoogleUseCase,
  }) : super(LoginInitial());

  Future<void> signInWithGoogle() async {
    emit(LoginLoading());
    final result = await signInWithGoogleUseCase(NoParams());

    result.fold(
      (failure) => emit(LoginFailure(message: failure.errorMessage)),
      (_) {
        emit(LoginSuccess());
      },
    );
  }
}
