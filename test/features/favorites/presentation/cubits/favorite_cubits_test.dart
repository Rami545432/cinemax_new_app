// ignore_for_file: inference_failure_on_instance_creation

import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movify/features/auth/domain/entities/user_entity.dart';
import 'package:movify/features/auth/presentation/cubits/session_state.dart';
import 'package:movify/features/favorite/domain/entities/favorite_entity.dart';
import 'package:movify/features/favorite/domain/use_cases/add_favorite_use_case.dart';
import 'package:movify/features/favorite/domain/use_cases/get_favorite_use_case.dart';
import 'package:movify/features/favorite/domain/use_cases/merge_guest_favorites_use_case.dart';
import 'package:movify/features/favorite/domain/use_cases/pull_cloud_favorites_use_case.dart';
import 'package:movify/features/favorite/domain/use_cases/remove_favorite_use_case.dart';
import 'package:movify/features/favorite/presentation/cubits/favorite_cubit.dart';
import 'package:movify/features/favorite/presentation/cubits/favorite_state.dart';

class MockMergeGuestFavoritesUseCase extends Mock
    implements MergeGuestFavoritesUseCase {}

class MockPullCloudFavoritesUseCase extends Mock
    implements PullCloudFavoritesUseCase {}

class MockGetFavoritesUseCase extends Mock implements GetFavoritesUseCase {}

class MockAddFavoriteUseCase extends Mock implements AddFavoriteUseCase {}

class MockRemoveFavoriteUseCase extends Mock implements RemoveFavoriteUseCase {}

void main() {
  late MockMergeGuestFavoritesUseCase mockMergeUseCase;
  late MockPullCloudFavoritesUseCase mockPullCloudUseCase;
  late MockGetFavoritesUseCase mockGetFavoritesUseCase;
  late MockAddFavoriteUseCase mockAddFavoriteUseCase;
  late MockRemoveFavoriteUseCase mockRemoveFavoriteUseCase;
  late StreamController<SessionState> sessionStreamController;

  final testUser = UserEntity(
    uid: 'user_123',
    email: 'test@test.com',
    displayName: 'Test User',
    photoUrl: '',
    isEmailVerified: true,
    isGuest: false,
    createdAt: DateTime.now(),
  );

  final guestUser = UserEntity.guest();

  setUp(() {
    mockMergeUseCase = MockMergeGuestFavoritesUseCase();
    mockPullCloudUseCase = MockPullCloudFavoritesUseCase();
    mockGetFavoritesUseCase = MockGetFavoritesUseCase();
    mockAddFavoriteUseCase = MockAddFavoriteUseCase();
    mockRemoveFavoriteUseCase = MockRemoveFavoriteUseCase();
    sessionStreamController = StreamController<SessionState>.broadcast();

    // Default mock behaviors
    when(
      () => mockMergeUseCase(any()),
    ).thenAnswer((_) async => const Right(unit));
    when(
      () => mockGetFavoritesUseCase(
        userId: any(named: 'userId'),
        contentType: any(named: 'contentType'),
      ),
    ).thenAnswer((_) async => const Right(<FavoriteEntity>[]));
  });

  tearDown(() {
    sessionStreamController.close();
  });

  FavoriteCubit buildCubit(SessionState initialState) => FavoriteCubit(
    mergeGuestFavoritesUseCase: mockMergeUseCase,
    pullCloudFavoritesUseCase: mockPullCloudUseCase,
    getFavoritesUseCase: mockGetFavoritesUseCase,
    addFavoriteUseCase: mockAddFavoriteUseCase,
    removeFavoriteUseCase: mockRemoveFavoriteUseCase,
    sessionStream: sessionStreamController.stream,
    initialSessionState: initialState,
  );

  group('FavoriteCubit - Authentication Flow', () {
    blocTest<FavoriteCubit, FavoriteState>(
      'starts as guest, then merges cloud data when user signs in',
      build: () => buildCubit(SessionGuest(user: guestUser)),
      act: (cubit) async {
        // Wait for initial constructor events to settle
        await Future.delayed(Duration.zero);
        // Simulate user successfully logging in explicitly
        sessionStreamController.add(SessionAuthenticated(user: testUser, isExplicitSignIn: true));
      },
      skip: 1, // Skips the async Loaded from the initial guest state
      expect: () => [isA<FavoriteLoading>(), isA<FavoriteLoaded>()],
      verify: (cubit) {
        // 1. Verify it merged guest favorites since it was the first sign-in
        verify(() => mockMergeUseCase(testUser.uid!)).called(1);

        // 2. Verify it fetched from Hive using the real user ID
        verify(
          () => mockGetFavoritesUseCase(userId: testUser.uid!),
        ).called(greaterThan(0));

        // 3. Verify internal state ID is updated
        expect(cubit.currentUserId, equals(testUser.uid));
      },
    );

    blocTest<FavoriteCubit, FavoriteState>(
      'clears user data and loads guest favorites when user signs out',
      build: () => buildCubit(SessionAuthenticated(user: testUser)),
      act: (cubit) async {
        // Wait for initial constructor events to settle
        await Future.delayed(Duration.zero);
        // Simulate user clicking sign out
        sessionStreamController.add(SessionGuest(user: guestUser));
      },
      skip: 1, // Skips the async Loaded from the initial auth state
      expect: () => [isA<FavoriteLoading>(), isA<FavoriteLoaded>()],
      verify: (cubit) {
        // 1. Verify we never merged because the initial state was a hot restart, 
        // and sign out shouldn't merge either.
        verifyNever(() => mockMergeUseCase(any()));

        // 2. Verify it instantly switched to reading guest data from Hive
        verify(
          () => mockGetFavoritesUseCase(userId: 'guest'),
        ).called(greaterThan(0));

        // 3. Verify internal state ID is updated
        expect(cubit.currentUserId, equals('guest'));
      },
    );
  });
}
