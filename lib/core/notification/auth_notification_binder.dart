import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/core/notification/notification_service.dart';
import 'package:movify/features/auth/presentation/cubits/session_cubit.dart';
import 'package:movify/features/auth/presentation/cubits/session_state.dart';

class AuthNotificationBinder extends StatelessWidget {
  const AuthNotificationBinder({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) =>
      BlocListener<SessionCubit, SessionState>(
        listenWhen: (prev, curr) => prev.runtimeType != curr.runtimeType,
        listener: (context, state) async {
          if (state is SessionAuthenticated) {
            // user logged in: attach token to user
            await NotificationService.instance.onUserAuthenticated();
          } else {
            // guest or unauthenticated
            await NotificationService.instance.onUserLoggedOutOrGuest();
          }
        },
        child: child,
      );
}
