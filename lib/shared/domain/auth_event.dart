// import 'package:movify/features/auth/domain/entities/user_entity.dart';

// sealed class AuthEvent {
//   const AuthEvent();
// }

// /// Fired by AuthRepoImpl after a successful login OR on cold-start session restore.
// /// [isNewSignIn] = true  → explicit login  → FavoriteCubit runs merge + cloud pull
// /// [isNewSignIn] = false → cold start      → FavoriteCubit loads from Hive only
// class AuthEventSignedIn extends AuthEvent {
//   final UserEntity user;
//   final bool isNewSignIn;
//   const AuthEventSignedIn({required this.user, required this.isNewSignIn});
// }

// /// Fired after sign-out or disableGuestMode.
// class AuthEventSignedOut extends AuthEvent {
//   const AuthEventSignedOut();
// }

// /// Fired after enableGuestMode or cold-start guest restore.
// class AuthEventGuest extends AuthEvent {
//   final UserEntity user;
//   const AuthEventGuest({required this.user});
// }

// /// Initial state — emitted before _initAuthState() completes.
// /// Router holds at splash while this is active.
// class AuthEventUnknown extends AuthEvent {
//   const AuthEventUnknown();
// }
