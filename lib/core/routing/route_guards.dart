// import 'dart:developer';

// import 'package:cinemax_app_new/core/utils/helper/guest_mode_service.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// import 'route_name.dart';
// import 'route_paths.dart';

// class RouteGuards {
//   static final _protectedRoutes = [
//     RouteName.home,
//     RouteName.series,
//     RouteName.favorite,
//     RouteName.profile,
//     RouteName.editProfile,
//     RouteName.navigation,
//     RouteName.search,
//   ];
//   static final authRoutes = [
//     RouteName.signIn,
//     RouteName.signUp,
//     RouteName.resetPassword,
//     RouteName.newPassword,
//     RouteName.verification,
//     RouteName.verficationPasswordEmail,
//     RouteName.initialAuth,
//     RouteName.onBoarding,
//   ];
//   static Future<String?> handleRedirect(
//     BuildContext context,
//     GoRouterState state,
//   ) async {
//     final currentPath = state.matchedLocation;
//     log(currentPath);
//     final user = FirebaseAuth.instance.currentUser;
//     final isGuestMode = await GuestModeService.getGuestMode();
//     final isAuthenticated = user != null || isGuestMode;
//     if (!isAuthenticated && _isProtectedRoute(currentPath)) {
//       return RoutePaths.onBoarding;
//     }
//     if (isAuthenticated && _isAuthRoute(currentPath)) {
//       return RoutePaths.home;
//     }
//     if (currentPath == '/' || currentPath == RoutePaths.root) {
//       return isAuthenticated ? RoutePaths.home : RoutePaths.onBoarding;
//     }
//     return null;
//   }

//   static bool _isProtectedRoute(String path) {
//     return _protectedRoutes.any((route) => path.startsWith(route));
//   }

//   static bool _isAuthRoute(String path) {
//     return authRoutes.any((route) => path.startsWith(route));
//   }

//   static Future<String?> emailVerificationGuard(
//     BuildContext context,
//     GoRouterState state,
//   ) async {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user != null && !user.emailVerified) {
//       return RoutePaths.verification;
//     }
//     return null;
//   }
// }
