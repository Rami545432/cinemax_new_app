import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:movify/core/auth/auth_status_provider.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:movify/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:movify/features/auth/domain/entities/user_entity.dart';
import 'package:movify/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo, AuthStatusProvider {
  final AuthLocalDataSource localDataSource;
  final AuthRemoteDataSource remoteDataSource;
  final _authStatusController = StreamController<AuthStatusEvent>.broadcast();

  AuthRepoImpl({required this.localDataSource, required this.remoteDataSource});
  @override
  Stream<AuthStatusEvent> get authStatusStream => _authStatusController.stream;

  void _broadcast(AuthStatusEvent event) {
    if (!_authStatusController.isClosed) {
      _authStatusController.add(event);
    }
  }

  // In AuthRepoImpl.currentAuthStatus
  @override
  Future<AuthStatusEvent> get currentAuthStatus async {
    final isGuest = await localDataSource.getGuestMode();
    debugPrint('🔍 currentAuthStatus → isGuest: $isGuest');

    final user = await remoteDataSource.getCurrentUser();
    debugPrint('🔍 currentAuthStatus → user: $user');

    if (isGuest) {
      return const AuthStatusEvent(status: AuthStatus.guest);
    }
    if (user != null) {
      return AuthStatusEvent(
        status: AuthStatus.authenticated,
        userId: user.toEntity().uid,
      );
    }
    return const AuthStatusEvent(status: AuthStatus.unauthenticated);
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      final user = await remoteDataSource.signInWithGoogle();
      await localDataSource.clearGuestMode();
      _broadcast(
        AuthStatusEvent(
          isFirstSignIn: true,
          status: AuthStatus.authenticated,
          userId: user.uid,
        ),
      );
      return right(user.toEntity());
    } on ServerFailure catch (e) {
      return left(e);
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getCurrentUser() async {
    try {
      final isGuest = await localDataSource.getGuestMode();
      if (isGuest) {
        return right(UserEntity.guest());
      }
      final user = await remoteDataSource.getCurrentUser();
      if (user != null) {
        return right(user.toEntity());
      }
      return right(null);
    } on ServerFailure catch (e) {
      return left(e);
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await remoteDataSource.signOut();
      await localDataSource.clearGuestMode();
      _broadcast(const AuthStatusEvent(status: AuthStatus.guest));
      return right(null);
    } on ServerFailure catch (e) {
      return left(e);
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> disableGuestMode() async {
    try {
      await localDataSource.clearGuestMode();
      _broadcast(const AuthStatusEvent(status: AuthStatus.guest));
      return right(null);
    } on ServerFailure catch (e) {
      return left(e);
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> enableGuestMode() async {
    try {
      await localDataSource.setGuestMode(true);
      final user = UserEntity.guest();
      _broadcast(const AuthStatusEvent(status: AuthStatus.guest));
      return right(user);
    } on ServerFailure catch (e) {
      return left(e);
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isGuestMode() async {
    try {
      final isGuest = await localDataSource.getGuestMode();
      return right(isGuest);
    } on ServerFailure catch (e) {
      return left(e);
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  void dispose() => _authStatusController.close();
}
