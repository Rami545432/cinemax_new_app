// import 'package:cinemax_app_new/features/auth/domain/entities/user_entity.dart';
// import 'package:cinemax_app_new/features/auth/domain/use_cases/disable_guest_mode_use_case.dart';
// import 'package:cinemax_app_new/features/auth/domain/use_cases/enable_guest_mode_use_case.dart';
// import 'package:cinemax_app_new/features/auth/domain/use_cases/get_current_user_use_case.dart';
// import 'package:cinemax_app_new/features/auth/domain/use_cases/get_is_first_time_use_case.dart';
// import 'package:cinemax_app_new/features/auth/domain/use_cases/is_guest_mode_use_case.dart';
// import 'package:cinemax_app_new/features/auth/domain/use_cases/reset_password_use_case.dart';
// import 'package:cinemax_app_new/features/auth/domain/use_cases/set_is_first_time_use_case.dart';
// import 'package:cinemax_app_new/features/auth/domain/use_cases/sign_in_with_email_use_case.dart';
// import 'package:cinemax_app_new/features/auth/domain/use_cases/sign_in_with_facebook_use_case.dart';
// import 'package:cinemax_app_new/features/auth/domain/use_cases/sign_in_with_google_use_case.dart';
// import 'package:cinemax_app_new/features/auth/domain/use_cases/sign_out_use_case.dart';
// import 'package:cinemax_app_new/features/auth/domain/use_cases/sign_up_with_email_use_case.dart';
// import 'package:cinemax_app_new/features/auth/presentation/cubits/auth_state.dart';
// import 'package:cinemax_app_new/shared/domain/use_cases/use_case.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class AuthCubit extends Cubit<AuthState> {
//   final SignInWithGoogleUseCase signInWithGoogleUseCase;
//   final SignInWithFacebookUseCase signInWithFacebookUseCase;
//   final SignInWithEmailUseCase signInWithEmailUseCase;
//   final SignUpWithEmailUseCase signUpWithEmailUseCase;
//   final SignOutUseCase signOutUseCase;
//   final GetCurrentUserUseCase getCurrentUserUseCase;
//   final ResetPasswordUseCase resetPasswordUseCase;
//   final EnableGuestModeUseCase enableGuestModeUseCase;
//   final DisableGuestModeUseCase disableGuestModeUseCase;
//   final IsGuestModeUseCase isGuestModeUseCase;
//   final GetIsFirstTimeUseCase getIsFirstTimeUseCase;
//   final SetIsFirstTimeUseCase setIsFirstTimeUseCase;

//   AuthCubit({
//     required this.signInWithGoogleUseCase,
//     required this.signInWithFacebookUseCase,
//     required this.signInWithEmailUseCase,
//     required this.signUpWithEmailUseCase,
//     required this.signOutUseCase,
//     required this.getCurrentUserUseCase,
//     required this.resetPasswordUseCase,
//     required this.enableGuestModeUseCase,
//     required this.disableGuestModeUseCase,
//     required this.isGuestModeUseCase,
//     required this.getIsFirstTimeUseCase,
//     required this.setIsFirstTimeUseCase,
//   }) : super(AuthUnknown());

//   // ═══════════════════════════════════════════════════════════════════
//   // CHECK AUTH STATUS — App cold start
//   // ═══════════════════════════════════════════════════════════════════

//   Future<void> checkAuthStatus() async {
//     emit(AuthUnknown());

//     final firstTimeResult = await getIsFirstTimeUseCase(NoParams());

//     final isFirstTime = firstTimeResult.fold((_) => true, (res) => res);

//     if (isFirstTime) {
//       emit(AuthFirstTime());
//       return;
//     }

//     final result = await getCurrentUserUseCase(NoParams());

//     result.fold(
//       (_) {
//         emit(AuthUnauthenticated());
//       },
//       (user) {
//         if (user == null) {
//           emit(AuthUnauthenticated());
//         } else if (user.isGuest) {
//           emit(AuthGuest(user: user));
//         } else {
//           emit(AuthAuthenticated(user: user));
//         }
//       },
//     );
//   }

//   Future<void> signInWithEmail({
//     required String email,
//     required String password,
//   }) async {
//     final result = await signInWithEmailUseCase(
//       SignInParams(email: email, password: password),
//     );

//     await result.fold(
//       (failure) async => emit(AuthFailure(message: failure.errorMessage)),
//       (user) async => _completeSignIn(user),
//     );
//   }

//   Future<void> signInWithGoogle() async {
//     final result = await signInWithGoogleUseCase(NoParams());

//     await result.fold(
//       (failure) async => emit(AuthFailure(message: failure.errorMessage)),
//       (user) async {
//         if (state is AuthGuest) {
//           await disableGuestModeUseCase(NoParams());
//         }
//         await _completeSignIn(user);
//       },
//     );
//   }

//   Future<void> signInWithFacebook() async {
//     final result = await signInWithFacebookUseCase(NoParams());

//     await result.fold(
//       (failure) async => emit(AuthFailure(message: failure.errorMessage)),
//       (user) async {
//         if (state is AuthGuest) {
//           await disableGuestModeUseCase(NoParams());
//         }
//         await _completeSignIn(user);
//       },
//     );
//   }

//   Future<void> signUpWithEmail({
//     required String email,
//     required String password,
//     required String displayName,
//   }) async {
//     final result = await signUpWithEmailUseCase(
//       SignUpParams(email: email, password: password, displayName: displayName),
//     );

//     await result.fold(
//       (failure) async => emit(AuthFailure(message: failure.errorMessage)),
//       (user) async => _completeSignIn(user),
//     );
//   }

//   // ═══════════════════════════════════════════════════════════════════
//   // SIGN OUT
//   // ═══════════════════════════════════════════════════════════════════

//   Future<void> signOut() async {
//     await signOutUseCase(NoParams());
//     await enableGuestModeUseCase(NoParams());

//     emit(AuthGuest(user: UserEntity.guest()));
//   }

//   // ═══════════════════════════════════════════════════════════════════
//   // GUEST MODE
//   // ═══════════════════════════════════════════════════════════════════

//   Future<void> enableGuestMode() async {
//     final result = await enableGuestModeUseCase(NoParams());
//     await result.fold(
//       (failure) async => emit(AuthFailure(message: failure.errorMessage)),
//       (user) async {
//         emit(AuthGuest(user: user));
//       },
//     );
//   }

//   Future<void> disableGuestMode() async {
//     final result = await disableGuestModeUseCase(NoParams());
//     result.fold((failure) => emit(AuthFailure(message: failure.errorMessage)), (
//       _,
//     ) {
//       emit(AuthUnauthenticated());
//     });
//   }

//   Future<void> isGuestMode() async {
//     final result = await isGuestModeUseCase(NoParams());
//     result.fold((failure) => emit(AuthFailure(message: failure.errorMessage)), (
//       isGuest,
//     ) {
//       if (isGuest) {
//         emit(AuthGuest(user: UserEntity.guest()));
//       }
//     });
//   }

//   // ═══════════════════════════════════════════════════════════════════
//   // PRIVATE
//   // ═══════════════════════════════════════════════════════════════════

//   Future<void> _completeSignIn(UserEntity user) async {
//     emit(AuthAuthenticated(user: user));

//     debugPrint('✅ Sign-in complete for ${user.uid}');
//   }
// }
