// ignore_for_file: inference_failure_on_instance_creation

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:movify/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:movify/features/auth/data/models/user_model.dart';
import 'package:movify/features/auth/data/repos/auth_repo_impl.dart';
import 'package:movify/features/auth/domain/entities/user_entity.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

class MockAuthLocalDataSource extends Mock implements AuthLocalDataSource {}

class MockAuthRepoImpl extends Mock implements AuthRepoImpl {}

void main() {
  late AuthRepoImpl repo;
  late MockAuthLocalDataSource mockLocalDataSource;
  late MockAuthRemoteDataSource mockRemoteDataSource;

  setUp(() async {
    mockLocalDataSource = MockAuthLocalDataSource();
    mockRemoteDataSource = MockAuthRemoteDataSource();

    // Stub for the constructor's _initAuthState
    when(
      () => mockLocalDataSource.getGuestMode(),
    ).thenAnswer((_) async => false);
    when(
      () => mockRemoteDataSource.getCurrentUser(),
    ).thenAnswer((_) async => null);

    repo = AuthRepoImpl(
      localDataSource: mockLocalDataSource,
      remoteDataSource: mockRemoteDataSource,
    );

    // Let the async _initAuthState complete
    await Future.delayed(Duration.zero);
    clearInteractions(mockLocalDataSource);
    clearInteractions(mockRemoteDataSource);
  });

  group('Sign in with Google', () {
    final fakeUserModel = UserModel(
      uid: '1',
      email: 'test@email.com',
      displayName: 'test',
      photoUrl: 'https://example.com/test.jpg',
      isEmailVerified: true,
      isGuest: false,
      createdAt: DateTime.now(),
    );
    test(
      'should return a UserEntity when Google Sign-In is successful and clear guest mode',
      () async {
        when(
          () => mockRemoteDataSource.signInWithGoogle(),
        ).thenAnswer((_) async => fakeUserModel);
        when(
          () => mockLocalDataSource.clearGuestMode(),
        ).thenAnswer((_) async {});

        final result = await repo.signInWithGoogle();
        expect(result, Right(fakeUserModel.toEntity()));
        verify(() => mockRemoteDataSource.signInWithGoogle()).called(1);
        verify(() => mockLocalDataSource.clearGuestMode()).called(1);
      },
    );

    test('should return a ServerFailure when Google Sign-In fails', () async {
      when(
        () => mockRemoteDataSource.signInWithGoogle(),
      ).thenThrow(const ServerFailure(errorMessage: 'Google Sign-In failed'));

      final result = await repo.signInWithGoogle();
      expect(
        result,
        const Left(ServerFailure(errorMessage: 'Google Sign-In failed')),
      );
      verify(() => mockRemoteDataSource.signInWithGoogle()).called(1);
      verifyNever(() => mockLocalDataSource.clearGuestMode());
    });
  });
  group('Sign out', () {
    test('should return void when Sign-Out is successful', () async {
      when(() => mockRemoteDataSource.signOut()).thenAnswer((_) async => ());
      when(() => mockLocalDataSource.clearGuestMode()).thenAnswer((_) async {});
      final result = await repo.signOut();
      expect(result, const Right(null));
      verify(() => mockRemoteDataSource.signOut()).called(1);
    });

    test('should return a ServerFailure when Sign-Out fails', () async {
      when(
        () => mockRemoteDataSource.signOut(),
      ).thenThrow(const ServerFailure(errorMessage: 'Sign-Out failed'));
      final result = await repo.signOut();
      expect(
        result,
        const Left(ServerFailure(errorMessage: 'Sign-Out failed')),
      );
      verify(() => mockRemoteDataSource.signOut()).called(1);
    });

    group('Get current user', () {
      final fakeUserModel = UserModel(
        uid: '1',
        email: 'test@email.com',
        displayName: 'test',
        photoUrl: 'https://example.com/test.jpg',
        isEmailVerified: true,
        isGuest: false,
        createdAt: DateTime.now(),
      );
      test('check get current user status in guest mode', () async {
        when(
          () => mockLocalDataSource.getGuestMode(),
        ).thenAnswer((_) async => true);
        final result = await repo.getCurrentUser();
        expect(result, Right(UserEntity.guest()));
        verify(() => mockLocalDataSource.getGuestMode()).called(1);
      });
      test('check get current user status in registered user', () async {
        when(
          () => mockLocalDataSource.getGuestMode(),
        ).thenAnswer((_) async => false);
        when(
          () => mockRemoteDataSource.getCurrentUser(),
        ).thenAnswer((_) async => fakeUserModel);
        final result = await repo.getCurrentUser();
        expect(result, Right(fakeUserModel.toEntity()));
        verify(() => mockLocalDataSource.getGuestMode()).called(1);
        verify(() => mockRemoteDataSource.getCurrentUser()).called(1);
      });
      test(
        'check get current user status in guest mode throws server failure',
        () async {
          when(() => mockLocalDataSource.getGuestMode()).thenThrow(
            const ServerFailure(errorMessage: 'Guest mode not found'),
          );
          final result = await repo.getCurrentUser();
          expect(
            result,
            const Left(ServerFailure(errorMessage: 'Guest mode not found')),
          );
          verify(() => mockLocalDataSource.getGuestMode()).called(1);
          verifyNever(() => mockRemoteDataSource.getCurrentUser());
        },
      );
      test(
        'check get current user status in registered user throws server failure',
        () async {
          when(
            () => mockLocalDataSource.getGuestMode(),
          ).thenAnswer((_) async => false);
          when(
            () => mockRemoteDataSource.getCurrentUser(),
          ).thenThrow(const ServerFailure(errorMessage: 'User not found'));
          final result = await repo.getCurrentUser();
          expect(
            result,
            const Left(ServerFailure(errorMessage: 'User not found')),
          );
          verify(() => mockLocalDataSource.getGuestMode()).called(1);
          verify(() => mockRemoteDataSource.getCurrentUser()).called(1);
        },
      );
    });
    group('Sign out ', () {
      test('check sign out', () async {
        when(() => mockRemoteDataSource.signOut()).thenAnswer((_) async => ());
        when(
          () => mockLocalDataSource.clearGuestMode(),
        ).thenAnswer((_) async => ());
        final result = await repo.signOut();
        expect(result, const Right(null));
        verify(() => mockRemoteDataSource.signOut()).called(1);
        verify(() => mockLocalDataSource.clearGuestMode()).called(1);
      });
    });
    group('Enable guest mode', () {
      test('check enable guest mode', () async {
        when(
          () => mockLocalDataSource.setGuestMode(true),
        ).thenAnswer((_) async => ());
        final result = await repo.enableGuestMode();
        expect(result, Right(UserEntity.guest()));
        verify(() => mockLocalDataSource.setGuestMode(true)).called(1);
      });
      test('check enable guest mode throws server failure', () async {
        when(
          () => mockLocalDataSource.setGuestMode(true),
        ).thenThrow(const ServerFailure(errorMessage: 'Guest mode not found'));
        final result = await repo.enableGuestMode();
        expect(
          result,
          const Left(ServerFailure(errorMessage: 'Guest mode not found')),
        );
        verify(() => mockLocalDataSource.setGuestMode(true)).called(1);
      });
    });
    group('Disable guest mode', () {
      test('check disable guest mode', () async {
        when(
          () => mockLocalDataSource.clearGuestMode(),
        ).thenAnswer((_) async => ());
        final result = await repo.disableGuestMode();
        expect(result, const Right(null));
        verify(() => mockLocalDataSource.clearGuestMode()).called(1);
      });
      test('check disable guest mode throws server failure', () async {
        when(
          () => mockLocalDataSource.clearGuestMode(),
        ).thenThrow(const ServerFailure(errorMessage: 'Guest mode not found'));
        final result = await repo.disableGuestMode();
        expect(
          result,
          const Left(ServerFailure(errorMessage: 'Guest mode not found')),
        );
        verify(() => mockLocalDataSource.clearGuestMode()).called(1);
      });
    });
    group('Is guest mode', () {
      test('check is guest mode', () async {
        when(
          () => mockLocalDataSource.getGuestMode(),
        ).thenAnswer((_) async => true);
        final result = await repo.isGuestMode();
        expect(result, const Right(true));
        verify(() => mockLocalDataSource.getGuestMode()).called(1);
      });
      test('check is guest mode throws server failure', () async {
        when(
          () => mockLocalDataSource.getGuestMode(),
        ).thenThrow(const ServerFailure(errorMessage: 'Guest mode not found'));
        final result = await repo.isGuestMode();
        expect(
          result,
          const Left(ServerFailure(errorMessage: 'Guest mode not found')),
        );
        verify(() => mockLocalDataSource.getGuestMode()).called(1);
      });
    });
  });
}
