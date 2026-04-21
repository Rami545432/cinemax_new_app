import 'package:cinemax_app_new/features/auth/domain/entities/user_entity.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/disable_guest_mode_use_case.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/enable_guest_mode_use_case.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/get_current_user_use_case.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/sign_out_use_case.dart';
import 'package:cinemax_app_new/features/auth/presentation/cubits/session_state.dart';
import 'package:cinemax_app_new/shared/domain/use_cases/use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  Future<void> checkAuthStatus() async {
    final result = await getCurrentUserUseCase(NoParams());

    result.fold(
      (_) => emit(SessionUnauthenticated()),
      (user) {
        if (user == null) {
          emit(SessionUnauthenticated());
        } else if (user.isGuest) {
          emit(SessionGuest(user: user));
        } else {
          emit(SessionAuthenticated(user: user));
        }
      },
    );
  }


  Future<void> signOut() async {
    await signOutUseCase(NoParams());
    await enableGuestModeUseCase(NoParams());
    emit(SessionGuest(user: UserEntity.guest()));
  }

  Future<void> enableGuestMode() async {
    final result = await enableGuestModeUseCase(NoParams());
    result.fold(
      (failure) => debugPrint('❌ Guest mode error: ${failure.errorMessage}'),
      (user) => emit(SessionGuest(user: user)),
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
