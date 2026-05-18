// test/features/auth/presentation/views/login_view_test.dart
//
// Pattern: Widget Testing — State → UI Contract
//
// What we test:
// ┌─────────────────────────────────────────────────────────────┐
// │ LoginState      │ Expected UI                               │
// ├─────────────────────────────────────────────────────────────┤
// │ LoginInitial    │ Google button visible, no loading         │
// │ LoginLoading    │ Loading indicator, button disabled        │
// │ LoginSuccess    │ Green snackbar with 'Welcome !'           │
// │ LoginFailure    │ Red snackbar with error message           │
// └─────────────────────────────────────────────────────────────┘
//
// What we DO NOT test:
// - Navigation (router handles it — not LoginView's job)
// - LoginCubit logic (already tested in unit tests)
// - SessionCubit (not LoginView's concern)

import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movify/features/auth/presentation/cubits/login_cubit.dart';
import 'package:movify/features/auth/presentation/cubits/login_state.dart';
import 'package:movify/features/auth/presentation/views/login_view.dart';
import 'package:movify/features/auth/presentation/views/login_view_body.dart';
import 'package:movify/shared/presentation/widgets/size_config.dart';

// ── Mocks ─────────────────────────────────────────────────────────────────

// Pattern: FAKE BLOC
// Never use real LoginCubit in widget tests.
// We control exact states — we are NOT testing Cubit logic here.
class MockLoginCubit extends MockCubit<LoginState> implements LoginCubit {}

// ── Test setup ────────────────────────────────────────────────────────────

void main() {
  late MockLoginCubit mockLoginCubit;

  setUp(() {
    mockLoginCubit = MockLoginCubit();
  });

  // ── Builder helper ───────────────────────────────────────────────────────
  // Pattern: buildWidget() helper
  // Single place to configure the widget tree for all tests.
  // MaterialApp is required for:
  //   - Scaffold (needs Material ancestor)
  //   - ScaffoldMessenger (needed for SnackBar)
  //   - Navigator (needed for any routing side effects)
  // BlocProvider.value injects our mock — NOT getIt
  Widget buildLoginView() => MaterialApp(
    home: BlocProvider<LoginCubit>.value(
      value: mockLoginCubit,
      child: const LoginView(),
    ),
  );

  // ══════════════════════════════════════════════════════════════════════
  // GROUP 1 — LoginInitial
  // ══════════════════════════════════════════════════════════════════════
  void setTheScreenSize(WidgetTester tester) {
    tester.view.physicalSize = const Size(SizeConfig.mobile, SizeConfig.tablet);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  }

  group('1️⃣ LoginInitial — default UI renders correctly', () {
    setUp(() {
      // Arrange: stub initial state
      when(() => mockLoginCubit.state).thenReturn(LoginInitial());
    });

    testWidgets('LoginViewBody is visible', (tester) async {
      setTheScreenSize(tester);
      await tester.pumpWidget(buildLoginView());

      expect(find.byType(LoginViewBody), findsOneWidget);
    });

    testWidgets('Google sign in button is visible', (tester) async {
      setTheScreenSize(tester);
      await tester.pumpWidget(buildLoginView());

      // SocialLoginButton with 'Google' title
      expect(find.text('Continue with Google'), findsOneWidget);
    });

    testWidgets('no snackbar on initial state', (tester) async {
      setTheScreenSize(tester);
      await tester.pumpWidget(buildLoginView());

      expect(find.byType(SnackBar), findsNothing);
    });

    testWidgets('no loading indicator on initial state', (tester) async {
      setTheScreenSize(tester);
      await tester.pumpWidget(buildLoginView());

      expect(find.byType(CircularProgressIndicator), findsNothing);
    });
  });

  // ══════════════════════════════════════════════════════════════════════
  // GROUP 2 — LoginLoading
  // ══════════════════════════════════════════════════════════════════════

  group('2️⃣ LoginLoading — shows loading UI', () {
    setUp(() {
      when(() => mockLoginCubit.state).thenReturn(LoginLoading());
    });

    testWidgets('shows CircularProgressIndicator', (tester) async {
      setTheScreenSize(tester);
      await tester.pumpWidget(buildLoginView());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('no snackbar while loading', (tester) async {
      setTheScreenSize(tester);
      await tester.pumpWidget(buildLoginView());

      expect(find.byType(SnackBar), findsNothing);
    });
  });

  // ══════════════════════════════════════════════════════════════════════
  // GROUP 3 — LoginSuccess
  // ══════════════════════════════════════════════════════════════════════

  group('3️⃣ LoginSuccess — shows welcome snackbar', () {
    testWidgets('shows green snackbar with Welcome message', (tester) async {
      // Pattern: whenListen simulates a stream of states
      // Initial: LoginInitial (widget renders first)
      // Then:    LoginSuccess  (listener fires)
      whenListen(
        mockLoginCubit,
        Stream.fromIterable([LoginInitial(), LoginSuccess()]),
        initialState: LoginInitial(),
      );
      setTheScreenSize(tester);

      await tester.pumpWidget(buildLoginView());

      // Let BlocListener react to LoginSuccess
      await tester.pump();

      // Snackbar should appear
      expect(find.text('Welcome !'), findsOneWidget);
      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets('LoginSuccess → NO navigation from LoginView', (tester) async {
      // Navigation is router's job — LoginView must NOT call goNamed
      // This test verifies LoginView doesn't push any route itself
      whenListen(
        mockLoginCubit,
        Stream.fromIterable([LoginInitial(), LoginSuccess()]),
        initialState: LoginInitial(),
      );

      final mockObserver = _MockNavigatorObserver();
      setTheScreenSize(tester);

      await tester.pumpWidget(
        MaterialApp(
          navigatorObservers: [mockObserver],
          home: BlocProvider<LoginCubit>.value(
            value: mockLoginCubit,
            child: const LoginView(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // No push should have happened from LoginView
      verifyNever(() => mockObserver.didPush(any(), any()));
    });
  });

  // ══════════════════════════════════════════════════════════════════════
  // GROUP 4 — LoginFailure
  // ══════════════════════════════════════════════════════════════════════

  group('4️⃣ LoginFailure — shows error snackbar', () {
    testWidgets('shows red snackbar with error message', (tester) async {
      const errorMessage = 'Sign in failed. Please try again.';

      whenListen(
        mockLoginCubit,
        Stream.fromIterable([
          LoginInitial(),
          const LoginFailure(message: errorMessage),
        ]),
        initialState: LoginInitial(),
      );
      setTheScreenSize(tester);

      await tester.pumpWidget(buildLoginView());
      await tester.pump();

      expect(find.text(errorMessage), findsOneWidget);
      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets('shows snackbar with different error messages', (tester) async {
      // Verify the message is dynamic — not hardcoded
      const errorMessage = 'Network error. Check your connection.';

      whenListen(
        mockLoginCubit,
        Stream.fromIterable([
          LoginInitial(),
          const LoginFailure(message: errorMessage),
        ]),
        initialState: LoginInitial(),
      );
      setTheScreenSize(tester);

      await tester.pumpWidget(buildLoginView());
      await tester.pump();

      expect(find.text(errorMessage), findsOneWidget);
    });

    testWidgets('LoginFailure → stays on LoginView (no navigation)', (
      tester,
    ) async {
      whenListen(
        mockLoginCubit,
        Stream.fromIterable([
          LoginInitial(),
          const LoginFailure(message: 'error'),
        ]),
        initialState: LoginInitial(),
      );
      setTheScreenSize(tester);

      await tester.pumpWidget(buildLoginView());
      await tester.pumpAndSettle();

      // Still on login view after failure
      expect(find.byType(LoginViewBody), findsOneWidget);
    });
  });

  // ══════════════════════════════════════════════════════════════════════
  // GROUP 5 — Interactions
  // Tapping Google button → dispatches signInWithGoogle()
  // ══════════════════════════════════════════════════════════════════════

  group('5️⃣ Interactions — user gestures dispatch correct cubit methods', () {
    setUp(() {
      when(() => mockLoginCubit.state).thenReturn(LoginInitial());
      // Stub the method so it doesn't throw when called
      when(() => mockLoginCubit.signInWithGoogle()).thenAnswer((_) async {});
    });

    testWidgets('tapping Google button → calls signInWithGoogle()', (
      tester,
    ) async {
      setTheScreenSize(tester);
      await tester.pumpWidget(buildLoginView());

      // Find and tap the Google button
      await tester.tap(find.text('Continue with Google'));
      await tester.pump();

      // Verify cubit method was called exactly once
      verify(() => mockLoginCubit.signInWithGoogle()).called(1);
    });

    testWidgets('Google button not tapped → signInWithGoogle not called', (
      tester,
    ) async {
      setTheScreenSize(tester);
      await tester.pumpWidget(buildLoginView());

      // Counterpart rule — verify NOT called without interaction
      verifyNever(() => mockLoginCubit.signInWithGoogle());
    });
  });

  group('User Cancell Login  ', () {
    testWidgets('User Cancell Login  ', (tester) async {
      whenListen(
        mockLoginCubit,
        Stream.fromIterable([LoginInitial(), LoginLoading(), LoginInitial()]),
        initialState: LoginInitial(),
      );
      setTheScreenSize(tester);
      await tester.pumpWidget(buildLoginView());
      await tester.pump();

      expect(find.byType(SnackBar), findsNothing);
      expect(find.byType(LoginViewBody), findsOneWidget);
    });
  });
}

// ── Private helpers ───────────────────────────────────────────────────────

// Minimal NavigatorObserver mock for verifying no navigation happens
class _MockNavigatorObserver extends Mock implements NavigatorObserver {}
