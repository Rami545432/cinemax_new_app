import 'package:cinemax_app_new/core/di/service_locator.dart';
import 'package:cinemax_app_new/features/auth/presentation/cubits/login_cubit.dart';
import 'package:cinemax_app_new/features/auth/presentation/cubits/login_state.dart';
import 'package:cinemax_app_new/features/auth/presentation/cubits/session_cubit.dart';
import 'package:cinemax_app_new/features/auth/presentation/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginCubit extends Mock implements LoginCubit {}
class MockSessionCubit extends Mock implements SessionCubit {}

void main() {
  late MockLoginCubit mockLoginCubit;
  late MockSessionCubit mockSessionCubit;

  setUp(() {
    mockLoginCubit = MockLoginCubit();
    mockSessionCubit = MockSessionCubit();

    // Stub the state and stream for MockLoginCubit
    when(() => mockLoginCubit.state).thenReturn(LoginInitial());
    when(() => mockLoginCubit.stream).thenAnswer((_) => const Stream.empty());
    
    // Register the mock in GetIt since LoginView uses getIt.get<LoginCubit>()
    getIt.reset();
    getIt.registerFactory<LoginCubit>(() => mockLoginCubit);
  });

  tearDown(() {
    getIt.reset();
  });

  Widget makeTestableWidget() => MaterialApp(
        home: BlocProvider<SessionCubit>.value(
          value: mockSessionCubit,
          child: const LoginView(),
        ),
      );

  group('LoginView', () {
    testWidgets('renders LoginView correctly', (tester) async {
      await tester.pumpWidget(makeTestableWidget());
      
      // Look for the tagline or google button to verify it rendered
      expect(find.text('Login'), findsOneWidget); // Make sure "Login" text actually exists in your widget!
    });
  });
}
