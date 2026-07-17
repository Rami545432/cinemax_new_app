import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movify/core/di/service_locator.dart';
import 'package:movify/features/auth/presentation/cubits/login_cubit.dart';
import 'package:movify/features/auth/presentation/cubits/login_state.dart';
import 'package:movify/features/auth/presentation/cubits/session_cubit.dart';
import 'package:movify/features/auth/presentation/cubits/session_state.dart';
import 'package:movify/features/auth/presentation/views/login_view.dart';
import 'package:movify/features/auth/presentation/widgets/build_footer.dart';
import 'package:movify/features/auth/presentation/widgets/login_tagline.dart';

class MockLoginCubit extends MockCubit<LoginState> implements LoginCubit {}

class MockSessionCubit extends MockCubit<SessionState>
    implements SessionCubit {}

void main() {
  late MockLoginCubit mockLoginCubit;
  // late MockSessionCubit mockSessionCubit;

  setUp(() async {
    mockLoginCubit = MockLoginCubit();

    // Stub the state and stream for MockLoginCubit
    when(() => mockLoginCubit.state).thenReturn(LoginInitial());
    when(() => mockLoginCubit.stream).thenAnswer((_) => const Stream.empty());

    // Register the mock in GetIt since LoginView uses getIt.get<LoginCubit>()
    await getIt.reset();
    getIt.registerFactory<LoginCubit>(() => mockLoginCubit);
  });

  Widget makeTestableWidget() => MaterialApp(
    home: BlocProvider<LoginCubit>(
      create: (context) => mockLoginCubit,
      child: const LoginView(),
    ),
  );

  group('LoginView Additional UI Tests', () {
    void setDesktopSize(WidgetTester tester) {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
    }

    testWidgets('LoginView renders LoginTagline and BuildFooter', (
      tester,
    ) async {
      setDesktopSize(tester);
      // ARRANGE
      when(() => mockLoginCubit.state).thenReturn(LoginInitial());

      // ACT
      await tester.pumpWidget(makeTestableWidget());

      // ASSERT
      expect(find.byType(LoginTagline), findsOneWidget);
      expect(find.byType(BuildFooter), findsOneWidget);
    });

    testWidgets('LoginView continues to render UI during LoginLoading state', (
      tester,
    ) async {
      setDesktopSize(tester);
      // ARRANGE: Set initial state to LoginLoading
      when(() => mockLoginCubit.state).thenReturn(LoginLoading());

      // ACT
      await tester.pumpWidget(makeTestableWidget());

      // ASSERT: The view should still be on screen and haven't crashed
      expect(find.byType(LoginView), findsOneWidget);
      expect(find.byType(LoginTagline), findsOneWidget);
      expect(find.byType(BuildFooter), findsOneWidget);
    });

    testWidgets('LoginView contains Scaffold widgets properly nested', (
      tester,
    ) async {
      setDesktopSize(tester);
      // ARRANGE
      when(() => mockLoginCubit.state).thenReturn(LoginInitial());

      // ACT
      await tester.pumpWidget(makeTestableWidget());

      // ASSERT: Both LoginView and LoginViewBody use a Scaffold.
      // We expect to find multiple Scaffolds in the tree (2 specifically based on current implementation).
      expect(find.byType(Scaffold), findsWidgets);
    });
  });
}
