import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:cinemax_app_new/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:cinemax_app_new/features/auth/domain/entities/user_entity.dart';
import 'package:cinemax_app_new/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthLocalDataSource localDataSource;
  final AuthRemoteDataSource remoteDataSource;

  AuthRepoImpl({required this.localDataSource, required this.remoteDataSource});

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      final user = await remoteDataSource.signInWithGoogle();
      await localDataSource.clearGuestMode();
      return right(user.toEntity());
    } on ServerFailure catch (e) {
      return left(e);
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> checkAuthStatus() async {
    try {
      final isGuest = await localDataSource.getGuestMode();
      if (isGuest) {
        return right(true);
      }
      final user = await remoteDataSource.getCurrentUser();
      if (user != null) {
        return right(true);
      }
      return right(false);
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
}
