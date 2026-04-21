import 'package:cinemax_app_new/features/auth/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

sealed class SessionState extends Equatable {
  const SessionState();

  @override
  List<Object?> get props => [];
}

class SessionUnknown extends SessionState {}

class SessionUnauthenticated extends SessionState {}

class SessionGuest extends SessionState {
  final UserEntity user;

  const SessionGuest({required this.user});

  @override
  List<Object> get props => [user];
}

class SessionAuthenticated extends SessionState {
  final UserEntity user;

  const SessionAuthenticated({required this.user});

  @override
  List<Object> get props => [user];
}
