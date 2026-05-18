// core/auth/auth_status_provider.dart

enum AuthStatus { authenticated, unauthenticated, guest }

class AuthStatusEvent {
  final AuthStatus status;
  final String? userId;
  final bool isFirstSignIn; // ← add this

  const AuthStatusEvent({
    required this.status,
    this.userId,
    this.isFirstSignIn = false, // default false
  });
}

abstract class AuthStatusProvider {
  Stream<AuthStatusEvent> get authStatusStream;
  Future<AuthStatusEvent> get currentAuthStatus;
}
