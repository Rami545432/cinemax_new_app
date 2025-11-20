import 'package:cinemax_app_new/core/utils/get_it.dart';
import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
import 'package:cinemax_app_new/features/auth/data/data_soureces/auth_local_data_source.dart';
import 'package:cinemax_app_new/features/auth/domain/entities/user_entity.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/continue_as_guest_use_case.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/disable_guest_mode_use_case.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/enable_guest_mode_use_case.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/get_current_user_use_case.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/is_guest_mode_use_case.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/reset_password_use_case.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/sign_in_with_email_use_case.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/sign_in_with_facebook_use_case.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/sign_in_with_google_use_case.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/sign_out_use_case.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/sign_up_with_email_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignInWithGoogleUseCase signInWithGoogleUseCase;
  final SignInWithFacebookUseCase signInWithFacebookUseCase;
  final SignInWithEmailUseCase signInWithEmailUseCase;
  final SignUpWithEmailUseCase signUpWithEmailUseCase;
  final SignOutUseCase signOutUseCase;
  final ContinueAsGuestUseCase continueAsGuestUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  final EnableGuestModeUseCase enableGuestModeUseCase;
  final DisableGuestModeUseCase disableGuestModeUseCase;
  final IsGuestModeUseCase isGuestModeUseCase;

  AuthCubit({
    required this.signInWithGoogleUseCase,
    required this.signInWithFacebookUseCase,
    required this.signInWithEmailUseCase,
    required this.signUpWithEmailUseCase,
    required this.signOutUseCase,
    required this.continueAsGuestUseCase,
    required this.getCurrentUserUseCase,
    required this.resetPasswordUseCase,
    required this.enableGuestModeUseCase,
    required this.disableGuestModeUseCase,
    required this.isGuestModeUseCase,
  }) : super(AuthInitial());

  Future<void> checkAuthStatus() async {
    emit(AuthLoading());

    final result = await getCurrentUserUseCase(NoParams());
    final localDataSource = getIt.get<AuthLocalDataSourceImpl>();
    final isFirstTime = await localDataSource.getFirstTime();
    if (isFirstTime) {
      emit(AuthFirstTime());
      return;
    }

    result.fold((failure) => emit(AuthUnauthenticated()), (user) {
      if (user == null) {
        emit(AuthUnauthenticated());
      } else if (user.isGuest) {
        emit(AuthGuest(user: user));
      } else {
        emit(AuthAuthenticated(user: user));
      }
    });
  }

  Future<void> signInWithGoogle() async {
    emit(AuthLoading());

    final result = await signInWithGoogleUseCase(NoParams());

    result.fold(
      (failure) => emit(AuthError(message: failure.errorMessage)),
      (user) => emit(AuthAuthenticated(user: user)),
    );
  }

  Future<void> signInWithFacebook() async {
    emit(AuthLoading());

    final result = await signInWithFacebookUseCase(NoParams());

    result.fold(
      (failure) => emit(AuthError(message: failure.errorMessage)),
      (user) => emit(AuthAuthenticated(user: user)),
    );
  }

  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());

    final result = await signInWithEmailUseCase(
      SignInParams(email: email, password: password),
    );

    result.fold(
      (failure) => emit(AuthError(message: failure.errorMessage)),
      (user) => emit(AuthAuthenticated(user: user)),
    );
  }

  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required String displayName,
  }) async {
    emit(AuthLoading());

    final result = await signUpWithEmailUseCase(
      SignUpParams(email: email, password: password, displayName: displayName),
    );

    result.fold(
      (failure) => emit(AuthError(message: failure.errorMessage)),
      (user) => emit(AuthAuthenticated(user: user)),
    );
  }

  Future<void> enableGuestMode() async {
    emit(AuthLoading());
    final result = await enableGuestModeUseCase(NoParams());
    result.fold(
      (failure) => emit(AuthError(message: failure.errorMessage)),
      (user) => emit(AuthGuest(user: user)),
    );
  }

  Future<void> disableGuestMode() async {
    emit(AuthLoading());
    final result = await disableGuestModeUseCase(NoParams());
    result.fold(
      (failure) => emit(AuthError(message: failure.errorMessage)),
      (_) => emit(AuthUnauthenticated()),
    );
  }

  Future<void> isGuestMode() async {
    emit(AuthLoading());
    final result = await isGuestModeUseCase(NoParams());
    result.fold(
      (failure) => emit(AuthError(message: failure.errorMessage)),
      (isGuest) => emit(AuthGuest(user: UserEntity.guest())),
    );
  }

  Future<void> signOut() async {
    emit(AuthLoading());

    final result = await signOutUseCase(NoParams());

    result.fold(
      (failure) => emit(AuthError(message: failure.errorMessage)),
      (_) => emit(AuthUnauthenticated()),
    );
  }

  Future<void> resetPassword(String email) async {
    emit(AuthLoading());

    final result = await resetPasswordUseCase(
      ResetPasswordParams(email: email),
    );

    result.fold(
      (failure) => emit(AuthError(message: failure.errorMessage)),
      (_) => emit(AuthPasswordResetSent()),
    );
  }
}
