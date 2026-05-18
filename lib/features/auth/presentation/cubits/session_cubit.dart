import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/core/auth/auth_status_provider.dart';
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
  final AuthStatusProvider authStatusProvider; // ← inject this

  late final StreamSubscription<AuthStatusEvent> _authSub;

  SessionCubit({
    required this.getCurrentUserUseCase,
    required this.signOutUseCase,
    required this.enableGuestModeUseCase,
    required this.disableGuestModeUseCase,
    required this.authStatusProvider,
  }) : super(SessionUnknown()) {
    _authSub = authStatusProvider.authStatusStream.listen(_onAuthChanged);
  }
  void _onAuthChanged(AuthStatusEvent event) {
    debugPrint('🎯 SessionCubit._onAuthChanged → ${event.status}');
    switch (event.status) {
      case AuthStatus.authenticated:
        // Re-read full user from repo to get complete UserEntity
        _refreshAuthenticatedUser();
        break;
      case AuthStatus.guest:
        emit(SessionGuest(user: UserEntity.guest()));
        break;
      case AuthStatus.unauthenticated:
        emit(SessionUnauthenticated());
        break;
    }
  }

  // Re-fetch full user because AuthStatusEvent only carries userId
  Future<void> _refreshAuthenticatedUser() async {
    final result = await getCurrentUserUseCase(NoParams());
    result.fold((_) => emit(SessionUnauthenticated()), (user) {
      if (user == null) {
        emit(SessionUnauthenticated());
      } else if (user.isGuest) {
        emit(SessionGuest(user: user));
      } else {
        emit(SessionAuthenticated(user: user));
      }
    });
  }

  Future<void> checkAuthStatus() async {
    final result = await getCurrentUserUseCase(NoParams());

    result.fold((_) => emit(SessionUnauthenticated()), (user) {
      if (user == null) {
        emit(SessionUnauthenticated());
      } else if (user.isGuest) {
        emit(SessionGuest(user: user));
      } else {
        emit(SessionAuthenticated(user: user));
      }
    });
  }

  Future<void> signOut() async {
    await signOutUseCase(NoParams());
    await enableGuestModeUseCase(NoParams());
  }

  Future<void> enableGuestMode() async {
    final result = await enableGuestModeUseCase(NoParams());
    result.fold(
      (failure) => debugPrint('❌ Guest mode error: ${failure.errorMessage}'),
      (user) => () {
        return;
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

  @override
  Future<void> close() {
    _authSub.cancel();
    return super.close();
  }
}
