import 'package:bloc_test/bloc_test.dart';
import 'package:cinemax_app_new/features/auth/domain/entities/user_entity.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/disable_guest_mode_use_case.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/enable_guest_mode_use_case.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/get_current_user_use_case.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/sign_out_use_case.dart';
import 'package:cinemax_app_new/features/auth/presentation/cubits/session_cubit.dart';
import 'package:cinemax_app_new/features/auth/presentation/cubits/session_state.dart';
import 'package:cinemax_app_new/shared/domain/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// 1. Create Mock Classes for all dependencies the Cubit needs.
// We use mocktail, which lets us simulate responses and verify calls!
class MockGetCurrentUserUseCase extends Mock implements GetCurrentUserUseCase {}

class MockSignOutUseCase extends Mock implements SignOutUseCase {}

class MockEnableGuestModeUseCase extends Mock
    implements EnableGuestModeUseCase {}

class MockDisableGuestModeUseCase extends Mock
    implements DisableGuestModeUseCase {}

// We need a fake NoParams object to pass into mock methods safely
class FakeNoParams extends Fake implements NoParams {}

void main() {
  // 2. Define our variables
  late SessionCubit sessionCubit;
  late MockGetCurrentUserUseCase mockGetCurrentUserUseCase;
  late MockSignOutUseCase mockSignOutUseCase;
  late MockEnableGuestModeUseCase mockEnableGuestModeUseCase;
  late MockDisableGuestModeUseCase mockDisableGuestModeUseCase;

  // 3. The setUp function runs BEFORE EVERY single test.
  // We initialize clean instances so tests don't affect each other.
  setUp(() {
    // Register our fallback value for mocktail argument matching
    registerFallbackValue(FakeNoParams());

    mockGetCurrentUserUseCase = MockGetCurrentUserUseCase();
    mockSignOutUseCase = MockSignOutUseCase();
    mockEnableGuestModeUseCase = MockEnableGuestModeUseCase();
    mockDisableGuestModeUseCase = MockDisableGuestModeUseCase();

    sessionCubit = SessionCubit(
      getCurrentUserUseCase: mockGetCurrentUserUseCase,
      signOutUseCase: mockSignOutUseCase,
      enableGuestModeUseCase: mockEnableGuestModeUseCase,
      disableGuestModeUseCase: mockDisableGuestModeUseCase,
    );
  });

  // 4. The tearDown function runs AFTER EVERY test.
  // We close the cubit to prevent memory leaks in testing!
  tearDown(() {
    sessionCubit.close();
  });

  // 5. Let's group related tests together for readability
  group('checkAuthStatus', () {
    test('initial state is SessionUnknown', () {
      expect(sessionCubit.state, isA<SessionUnknown>());
    });

    // ------------------------------------------------------------------
    // NEW WAY: Using blocTest
    // ------------------------------------------------------------------
    // blocTest acts like a super-powered test() function designed specifically for Cubits.
    // It takes 3 main stages: build, act, and expect.

    blocTest<SessionCubit, SessionState>(
      'emits [SessionUnauthenticated] when user is null',
      // BUILD: Return the Cubit you want to test and set up your Mocks
      build: () {
        when(
          () => mockGetCurrentUserUseCase(any()),
        ).thenAnswer((_) async => const Right(null));
        return sessionCubit;
      },
      // ACT: What method do you want to trigger?
      act: (cubit) => cubit.checkAuthStatus(),
      // EXPECT: What states should be emitted in order? (We don't need expectLater anymore!)
      expect: () => [isA<SessionUnauthenticated>()],
      // VERIFY: (Optional) Make sure our mocks were actually interacted with
      verify: (_) {
        verify(() => mockGetCurrentUserUseCase(any())).called(1);
      },
    );

    // Let's solve the TODO together using blocTest!
    blocTest<SessionCubit, SessionState>(
      'emits [SessionAuthenticated] when user is found and not guest',
      build: () {
        // Arrange
        const fakeUser = UserEntity(
          uid: '123',
          email: 'test@test.com',
          displayName: 'Test',
          photoUrl: '',
          isGuest: false,
          isEmailVerified: true,
          createdAt: null,
        );
        when(
          () => mockGetCurrentUserUseCase(any()),
        ).thenAnswer((_) async => const Right(fakeUser));
        return sessionCubit;
      },
      act: (cubit) => cubit.checkAuthStatus(),
      expect: () => [
        // We can even check if the state contains the EXACT fake user we created!
        isA<SessionAuthenticated>().having(
          (state) => state.user.uid,
          'uid',
          '123',
        ),
      ],
    );
  });

  group('signOut', () {
    blocTest<SessionCubit, SessionState>(
      'emits [SessionUnauthenticated] when sign out is successful',
      build: () {
        when(
          () => mockSignOutUseCase(any()),
        ).thenAnswer((_) async => const Right(null));
        return sessionCubit;
      },
      act: (cubit) => cubit.signOut(),
      expect: () => [isA<SessionUnauthenticated>()],
      verify: (_) {
        verify(() => mockSignOutUseCase(any())).called(1);
      },
    );
  });

  group('enableGuestMode', () {
    blocTest<SessionCubit, SessionState>(
      'emits [SessionGuestMode] when guest mode is enabled',
      build: () {
        when(
          () => mockEnableGuestModeUseCase(any()),
        ).thenAnswer((_) async => Right(UserEntity.guest()));
        return sessionCubit;
      },
      act: (cubit) => cubit.enableGuestMode(),
      expect: () => [isA<SessionGuest>()],
      verify: (_) {
        verify(() => mockEnableGuestModeUseCase(any())).called(1);
      },
    );
  });

  group('disableGuestMode', () {
    blocTest<SessionCubit, SessionState>(
      'emits [SessionUnauthenticated] when guest mode is disabled',
      build: () {
        when(
          () => mockDisableGuestModeUseCase(any()),
        ).thenAnswer((_) async => const Right(null));
        return sessionCubit;
      },
      act: (cubit) => cubit.disableGuestMode(),
      expect: () => [isA<SessionUnauthenticated>()],
      verify: (_) {
        verify(() => mockDisableGuestModeUseCase(any())).called(1);
      },
    );
  });
}
