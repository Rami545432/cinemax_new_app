import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/core/domain/use_cases/no_params.dart';
import 'package:movify/features/auth/domain/entities/user_entity.dart';
import 'package:movify/features/auth/domain/use_cases/disable_guest_mode_use_case.dart';
import 'package:movify/features/auth/domain/use_cases/enable_guest_mode_use_case.dart';
import 'package:movify/features/auth/domain/use_cases/get_current_user_use_case.dart';
import 'package:movify/features/auth/domain/use_cases/sign_out_use_case.dart';
import 'package:movify/features/auth/presentation/cubits/session_state.dart';

class SessionCubit extends Cubit<SessionState> {
  final GetCurrentUserUseCase getCurrentUserUseCase;
  final SignOutUseCase signOutUseCase;
  final EnableGuestModeUseCase enableGuestModeUseCase;
  final DisableGuestModeUseCase disableGuestModeUseCase;

  SessionCubit({
    required this.getCurrentUserUseCase,
    required this.signOutUseCase,
    required this.enableGuestModeUseCase,
    required this.disableGuestModeUseCase,
  }) : super(SessionUnknown());

  /// Called explicitly by other cubits (like LoginCubit) after a successful login
  void setAuthenticated(UserEntity user) {
    if (user.uid != null) {
      FirebaseCrashlytics.instance.setUserIdentifier(user.uid!);
    }
    emit(SessionAuthenticated(user: user, isExplicitSignIn: true));
  }

  Future<void> checkAuthStatus({bool isExplicitSignIn = false}) async {
    final result = await getCurrentUserUseCase(NoParams());

    result.fold((_) => emit(SessionUnauthenticated()), (user) {
      if (user == null) {
        emit(SessionUnauthenticated());
      } else if (user.isGuest) {
        FirebaseCrashlytics.instance.setUserIdentifier(''); // Clear it so Crashlytics uses the unique device ID
        emit(SessionGuest(user: user));
      } else {
        if (user.uid != null) {
          FirebaseCrashlytics.instance.setUserIdentifier(user.uid!);
        }
        emit(SessionAuthenticated(user: user, isExplicitSignIn: isExplicitSignIn));
      }
    });
  }

  Future<void> signOut() async {
    await signOutUseCase(NoParams());
    await enableGuestModeUseCase(NoParams());
    FirebaseCrashlytics.instance.setUserIdentifier(''); // Clear the identifier
    emit(SessionGuest(user: UserEntity.guest()));
  }

  Future<void> enableGuestMode() async {
    final result = await enableGuestModeUseCase(NoParams());
    result.fold(
      (failure) => debugPrint('❌ Guest mode error: ${failure.errorMessage}'),
      (user) {
        FirebaseCrashlytics.instance.setUserIdentifier('');
        emit(SessionGuest(user: user));
      },
    );
  }

  Future<void> disableGuestMode() async {
    final result = await disableGuestModeUseCase(NoParams());
    result.fold(
      (failure) => debugPrint('❌ Disable guest error: ${failure.errorMessage}'),
      (_) => emit(SessionUnauthenticated()),
    );
  }
}
