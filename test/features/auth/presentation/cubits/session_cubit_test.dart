import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';

import 'package:cinemax_app_new/features/auth/domain/entities/user_entity.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/disable_guest_mode_use_case.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/enable_guest_mode_use_case.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/get_current_user_use_case.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/sign_out_use_case.dart';
import 'package:cinemax_app_new/features/auth/presentation/cubits/session_cubit.dart';
import 'package:cinemax_app_new/features/auth/presentation/cubits/session_state.dart';
import 'package:cinemax_app_new/shared/domain/use_cases/use_case.dart';

// 1. Create Mock Classes for all dependencies the Cubit needs.
// We use mocktail, which lets us simulate responses and verify calls!
class MockGetCurrentUserUseCase extends Mock implements GetCurrentUserUseCase {}
class MockSignOutUseCase extends Mock implements SignOutUseCase {}
class MockEnableGuestModeUseCase extends Mock implements EnableGuestModeUseCase {}
class MockDisableGuestModeUseCase extends Mock implements DisableGuestModeUseCase {}

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

    test('emits [SessionUnauthenticated] when user is null', () async {
      // ARRANGE: What should our mock dependencies do when called?
      // When getCurrentUserUseCase is called with ANY NoParams, return a Right(null).
      when(() => mockGetCurrentUserUseCase(any())).thenAnswer((_) async => const Right(null));

      // To test Cubit streams, we expect outcomes on the stream BEFORE acting.
      final expectedStates = [
        isA<SessionUnauthenticated>(),
      ];
      
      expectLater(sessionCubit.stream, emitsInOrder(expectedStates));

      // ACT: Call the method we want to test
      await sessionCubit.checkAuthStatus();
      
      // Verify that our mock was actually called exactly 1 time
      verify(() => mockGetCurrentUserUseCase(any())).called(1);
    });

    // TODO: We will write this one together!
    // test('emits [SessionAuthenticated] when user is found and not guest', () async { ... });
  });
}
