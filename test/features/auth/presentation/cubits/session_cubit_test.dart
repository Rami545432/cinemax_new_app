// // test/features/auth/presentation/cubits/session_cubit_test.dart
// //
// // Pattern tested: OBSERVER pattern
// // SessionCubit subscribes to ListenToAuthEventsUseCase stream.
// // We verify that every AuthEvent produces the correct SessionState.
// //
// // What we test:
// // ┌─────────────────────────────────────────────────────────────────┐
// // │ AuthEvent                    │ Expected SessionState            │
// // ├─────────────────────────────────────────────────────────────────┤
// // │ AuthEventSignedIn(user, true) │ SessionAuthenticated(user)      │
// // │ AuthEventSignedIn(user, false)│ SessionAuthenticated(user)      │
// // │ AuthEventGuest(user)          │ SessionGuest(user)              │
// // │ AuthEventSignedOut()          │ SessionUnauthenticated()        │
// // │ AuthEventUnknown()            │ SessionUnknown()                │
// // ├─────────────────────────────────────────────────────────────────┤
// // │ Action                       │ Expected behavior                │
// // ├─────────────────────────────────────────────────────────────────┤
// // │ signOut() success            │ calls enableGuestMode()          │
// // │ signOut() failure            │ logs error, no state change      │
// // │ enableGuestMode() success    │ no direct emit (stream handles)  │
// // │ enableGuestMode() failure    │ logs error, no state change      │
// // │ disableGuestMode() success   │ no direct emit (stream handles)  │
// // │ disableGuestMode() failure   │ logs error, no state change      │
// // │ close()                      │ subscription cancelled           │
// // └─────────────────────────────────────────────────────────────────┘
// //
// // Key insight: SessionCubit never emits directly from actions.
// // Actions call use cases → repo emits AuthEvent → stream handles state.
// // We test the STREAM REACTION separately from the ACTIONS.

// import 'dart:async';

// import 'package:bloc_test/bloc_test.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:movify/core/domain/use_cases/no_params.dart';
// import 'package:movify/core/errors/failure.dart';
// import 'package:movify/features/auth/domain/entities/user_entity.dart';
// import 'package:movify/features/auth/domain/use_cases/disable_guest_mode_use_case.dart';
// import 'package:movify/features/auth/domain/use_cases/enable_guest_mode_use_case.dart';
// import 'package:movify/features/auth/domain/use_cases/sign_out_use_case.dart';
// import 'package:movify/features/auth/presentation/cubits/session_cubit.dart';
// import 'package:movify/features/auth/presentation/cubits/session_state.dart';
// import 'package:movify/shared/domain/auth_event.dart';
// import 'package:movify/shared/domain/use_cases/listen_to_auth_service_use_case.dart';

// // ── Mocks ─────────────────────────────────────────────────────────────────

// class MockListenToAuthEventsUseCase extends Mock
//     implements ListenToAuthEventsUseCase {}

// class MockSignOutUseCase extends Mock implements SignOutUseCase {}

// class MockEnableGuestModeUseCase extends Mock
//     implements EnableGuestModeUseCase {}

// class MockDisableGuestModeUseCase extends Mock
//     implements DisableGuestModeUseCase {}

// class FakeNoParams extends Fake implements NoParams {}

// // ── Fake data ─────────────────────────────────────────────────────────────

// // Real instances — never mock data classes
// final fakeUser = UserEntity(
//   uid: 'test-uid',
//   displayName: 'Test User',
//   email: 'test@test.com',
//   isEmailVerified: true,
//   photoUrl: 'https://example.com/photo.jpg',
//   isGuest: false,
//   createdAt: DateTime(2024),
// );

// final fakeGuestUser = UserEntity.guest();

// // ══════════════════════════════════════════════════════════════════════════
// // TESTS
// // ══════════════════════════════════════════════════════════════════════════

// void main() {
//   late MockListenToAuthEventsUseCase mockListenToAuthEvents;
//   late MockSignOutUseCase mockSignOut;
//   late MockEnableGuestModeUseCase mockEnableGuestMode;
//   late MockDisableGuestModeUseCase mockDisableGuestMode;
//   late StreamController<AuthEvent> authEventController;

//   setUpAll(() {
//     registerFallbackValue(FakeNoParams());
//   });

//   setUp(() {
//     mockListenToAuthEvents = MockListenToAuthEventsUseCase();
//     mockSignOut = MockSignOutUseCase();
//     mockEnableGuestMode = MockEnableGuestModeUseCase();
//     mockDisableGuestMode = MockDisableGuestModeUseCase();

//     // Fresh stream controller for every test
//     authEventController = StreamController<AuthEvent>.broadcast();

//     // Default stub — returns our controlled stream
//     when(
//       () => mockListenToAuthEvents(),
//     ).thenAnswer((_) => authEventController.stream);
//   });

//   tearDown(() async {
//     await authEventController.close();
//   });

//   // ── Builder helper ────────────────────────────────────────────────────
//   // Creates SessionCubit AFTER stubs are ready.
//   // Constructor calls _init() which subscribes to the stream immediately.
//   SessionCubit buildCubit() => SessionCubit(
//     listenToAuthEventsUseCase: mockListenToAuthEvents,
//     signOutUseCase: mockSignOut,
//     enableGuestModeUseCase: mockEnableGuestMode,
//     disableGuestModeUseCase: mockDisableGuestMode,
//   );

//   // ══════════════════════════════════════════════════════════════════════
//   // GROUP 1 — Initial state
//   // ══════════════════════════════════════════════════════════════════════

//   group('1️⃣ Initial state', () {
//     test('initial state → SessionUnknown', () {
//       final cubit = buildCubit();
//       expect(cubit.state, isA<SessionUnknown>());
//       cubit.close();
//     });

//     test('subscribes to auth stream on construction', () {
//       buildCubit().close();
//       // Verify stream was subscribed to exactly once
//       verify(() => mockListenToAuthEvents()).called(1);
//     });
//   });

//   // ══════════════════════════════════════════════════════════════════════
//   // GROUP 2 — AuthEvent → SessionState (Observer pattern)
//   // This is the CORE test — verifies our Pub/Sub architecture works
//   // ══════════════════════════════════════════════════════════════════════

//   group('2️⃣ AuthEvent → SessionState (Observer pattern)', () {
//     blocTest<SessionCubit, SessionState>(
//       'AuthEventSignedIn(isNewSignIn: true) → SessionAuthenticated',
//       build: buildCubit,
//       act: (cubit) => authEventController.add(
//         AuthEventSignedIn(user: fakeUser, isNewSignIn: true),
//       ),
//       expect: () => [
//         isA<SessionAuthenticated>().having(
//           (s) => s.user,
//           'user',
//           equals(fakeUser),
//         ),
//       ],
//     );

//     blocTest<SessionCubit, SessionState>(
//       'AuthEventSignedIn(isNewSignIn: false) → SessionAuthenticated '
//       '(cold start same result)',
//       build: buildCubit,
//       act: (cubit) => authEventController.add(
//         AuthEventSignedIn(user: fakeUser, isNewSignIn: false),
//       ),
//       expect: () => [
//         isA<SessionAuthenticated>().having(
//           (s) => s.user,
//           'user',
//           equals(fakeUser),
//         ),
//       ],
//     );

//     blocTest<SessionCubit, SessionState>(
//       'AuthEventGuest → SessionGuest',
//       build: buildCubit,
//       act: (cubit) =>
//           authEventController.add(AuthEventGuest(user: fakeGuestUser)),
//       expect: () => [
//         isA<SessionGuest>().having(
//           (s) => s.user,
//           'user',
//           equals(fakeGuestUser),
//         ),
//       ],
//     );

//     blocTest<SessionCubit, SessionState>(
//       'AuthEventSignedOut → SessionUnauthenticated',
//       build: buildCubit,
//       act: (cubit) => authEventController.add(const AuthEventSignedOut()),
//       expect: () => [isA<SessionUnauthenticated>()],
//     );

//     blocTest<SessionCubit, SessionState>(
//       'AuthEventUnknown → SessionUnknown',
//       build: buildCubit,
//       act: (cubit) => authEventController.add(const AuthEventUnknown()),
//       expect: () => [isA<SessionUnknown>()],
//     );

//     // ── Counterpart rule — wrong events don't produce wrong states ──────

//     blocTest<SessionCubit, SessionState>(
//       'AuthEventSignedIn → does NOT emit SessionGuest or SessionUnauthenticated',
//       build: buildCubit,
//       act: (cubit) => authEventController.add(
//         AuthEventSignedIn(user: fakeUser, isNewSignIn: true),
//       ),
//       expect: () => [isA<SessionAuthenticated>()],
//       // If SessionGuest or SessionUnauthenticated appeared,
//       // expect would fail — counterpart verified implicitly
//     );

//     // ── Multiple events in sequence ──────────────────────────────────────

//     blocTest<SessionCubit, SessionState>(
//       'stream emits multiple events → SessionCubit reacts to each correctly',
//       build: buildCubit,
//       act: (cubit) async {
//         authEventController.add(AuthEventGuest(user: fakeGuestUser));
//         await Future.delayed(Duration.zero);
//         authEventController.add(
//           AuthEventSignedIn(user: fakeUser, isNewSignIn: true),
//         );
//         await Future.delayed(Duration.zero);
//         authEventController.add(const AuthEventSignedOut());
//       },
//       expect: () => [
//         isA<SessionGuest>(),
//         isA<SessionAuthenticated>(),
//         isA<SessionUnauthenticated>(),
//       ],
//     );
//   });

//   // ══════════════════════════════════════════════════════════════════════
//   // GROUP 3 — signOut() action
//   // signOut() calls use case → repo emits AuthEventSignedOut
//   // then enables guest mode → repo emits AuthEventGuest
//   // SessionCubit does NOT emit directly — stream handles it
//   // ══════════════════════════════════════════════════════════════════════

//   group('3️⃣ signOut() action', () {
//     blocTest<SessionCubit, SessionState>(
//       'signOut() success → calls enableGuestMode()',
//       build: () {
//         when(
//           () => mockSignOut(any()),
//         ).thenAnswer((_) async => const Right(null));
//         when(
//           () => mockEnableGuestMode(any()),
//         ).thenAnswer((_) async => Right(fakeGuestUser));
//         return buildCubit();
//       },
//       act: (cubit) => cubit.signOut(),
//       verify: (_) {
//         // signOut called once
//         verify(() => mockSignOut(any())).called(1);
//         // enableGuestMode called after successful signOut
//         verify(() => mockEnableGuestMode(any())).called(1);
//       },
//     );

//     blocTest<SessionCubit, SessionState>(
//       'signOut() failure → logs error, enableGuestMode NOT called',
//       build: () {
//         when(() => mockSignOut(any())).thenAnswer(
//           (_) async =>
//               left(const ServerFailure(errorMessage: 'Sign out failed')),
//         );
//         return buildCubit();
//       },
//       act: (cubit) => cubit.signOut(),
//       expect: () => [], // no state change — stream not triggered
//       verify: (_) {
//         verify(() => mockSignOut(any())).called(1);
//         // enableGuestMode should NOT be called on failure
//         verifyNever(() => mockEnableGuestMode(any()));
//       },
//     );
//   });

//   // ══════════════════════════════════════════════════════════════════════
//   // GROUP 4 — enableGuestMode() action
//   // ══════════════════════════════════════════════════════════════════════

//   group('4️⃣ enableGuestMode() action', () {
//     blocTest<SessionCubit, SessionState>(
//       'enableGuestMode() success → calls use case once, '
//       'no direct emit (stream handles state)',
//       build: () {
//         when(
//           () => mockEnableGuestMode(any()),
//         ).thenAnswer((_) async => Right(fakeGuestUser));
//         return buildCubit();
//       },
//       act: (cubit) => cubit.enableGuestMode(),
//       expect: () => [], // no direct emit — repo pushes AuthEventGuest to stream
//       verify: (_) {
//         verify(() => mockEnableGuestMode(any())).called(1);
//       },
//     );

//     blocTest<SessionCubit, SessionState>(
//       'enableGuestMode() failure → logs error, no state change',
//       build: () {
//         when(() => mockEnableGuestMode(any())).thenAnswer(
//           (_) async =>
//               left(const ServerFailure(errorMessage: 'Guest mode failed')),
//         );
//         return buildCubit();
//       },
//       act: (cubit) => cubit.enableGuestMode(),
//       expect: () => [], // no state change on failure
//       verify: (_) {
//         verify(() => mockEnableGuestMode(any())).called(1);
//       },
//     );
//   });

//   // ══════════════════════════════════════════════════════════════════════
//   // GROUP 5 — disableGuestMode() action
//   // ══════════════════════════════════════════════════════════════════════

//   group('5️⃣ disableGuestMode() action', () {
//     blocTest<SessionCubit, SessionState>(
//       'disableGuestMode() success → calls use case once, '
//       'no direct emit (stream handles state)',
//       build: () {
//         when(
//           () => mockDisableGuestMode(any()),
//         ).thenAnswer((_) async => const Right(null));
//         return buildCubit();
//       },
//       act: (cubit) => cubit.disableGuestMode(),
//       expect: () => [], // no direct emit — repo pushes AuthEventSignedOut
//       verify: (_) {
//         verify(() => mockDisableGuestMode(any())).called(1);
//       },
//     );

//     blocTest<SessionCubit, SessionState>(
//       'disableGuestMode() failure → logs error, no state change',
//       build: () {
//         when(() => mockDisableGuestMode(any())).thenAnswer(
//           (_) async =>
//               left(const ServerFailure(errorMessage: 'Disable guest failed')),
//         );
//         return buildCubit();
//       },
//       act: (cubit) => cubit.disableGuestMode(),
//       expect: () => [],
//       verify: (_) {
//         verify(() => mockDisableGuestMode(any())).called(1);
//       },
//     );
//   });

//   // ══════════════════════════════════════════════════════════════════════
//   // GROUP 6 — Lifecycle
//   // ══════════════════════════════════════════════════════════════════════

//   group('6️⃣ Lifecycle — subscription management', () {
//     test(
//       'close() cancels stream subscription — no more state changes',
//       () async {
//         final cubit = buildCubit();

//         // Close the cubit
//         await cubit.close();

//         // Stream emits after close — should be ignored
//         // If subscription wasn't cancelled this would throw
//         // "Cannot emit after close"
//         expect(
//           () => authEventController.add(
//             AuthEventSignedIn(user: fakeUser, isNewSignIn: true),
//           ),
//           returnsNormally, // stream emits but cubit ignores it ✅
//         );
//       },
//     );

//     test('stream subscription starts on construction', () {
//       final cubit = buildCubit();

//       // Verify _init() subscribed exactly once
//       verify(() => mockListenToAuthEvents()).called(1);

//       cubit.close();
//     });
//   });

//   // ══════════════════════════════════════════════════════════════════════
//   // GROUP 7 — Edge cases
//   // ══════════════════════════════════════════════════════════════════════

//   group('7️⃣ Edge cases', () {
//     blocTest<SessionCubit, SessionState>(
//       'same event emitted twice → emits same state twice',
//       build: buildCubit,
//       act: (cubit) async {
//         authEventController.add(
//           AuthEventSignedIn(user: fakeUser, isNewSignIn: true),
//         );
//         await Future.delayed(Duration.zero);
//         authEventController.add(
//           AuthEventSignedIn(user: fakeUser, isNewSignIn: true),
//         );
//       },
//       expect: () => [isA<SessionAuthenticated>(), isA<SessionAuthenticated>()],
//     );

//     blocTest<SessionCubit, SessionState>(
//       'AuthEventSignedIn with different isNewSignIn values → '
//       'both produce SessionAuthenticated (isNewSignIn is for FavoriteCubit only)',
//       build: buildCubit,
//       act: (cubit) async {
//         // Cold start
//         authEventController.add(
//           AuthEventSignedIn(user: fakeUser, isNewSignIn: false),
//         );
//         await Future.delayed(Duration.zero);
//         // New login
//         authEventController.add(
//           AuthEventSignedIn(user: fakeGuestUser, isNewSignIn: true),
//         );
//       },
//       expect: () => [
//         isA<SessionAuthenticated>(), // cold start
//         isA<SessionAuthenticated>(), // new login — same state
//         // SessionCubit doesn't care about isNewSignIn
//         // FavoriteCubit uses it to decide setUser vs handleSignIn
//       ],
//     );
//   });
// }
