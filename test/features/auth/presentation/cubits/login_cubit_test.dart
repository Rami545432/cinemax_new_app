import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movify/core/domain/use_cases/no_params.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/features/auth/domain/entities/user_entity.dart';
import 'package:movify/features/auth/domain/use_cases/sign_in_with_google_use_case.dart';
import 'package:movify/features/auth/presentation/cubits/login_cubit.dart';
import 'package:movify/features/auth/presentation/cubits/login_state.dart';

class MockSignInWithGoogleUseCase extends Mock
    implements SignInWithGoogleUseCase {}

class FakeNoParams extends Fake implements NoParams {}

void main() {
  late LoginCubit loginCubit;
  late MockSignInWithGoogleUseCase mockSignInWithGoogleUseCase;
  setUpAll(() {
    registerFallbackValue(FakeNoParams());
  });
  setUp(() {
    mockSignInWithGoogleUseCase = MockSignInWithGoogleUseCase();
    loginCubit = LoginCubit(
      signInWithGoogleUseCase: mockSignInWithGoogleUseCase,
    );
  });
  tearDown(() => loginCubit.close());
  group('Testing Login Cubit ', () {
    test('Initial State should be LoginInitial', () {
      expect(loginCubit.state, LoginInitial());
    });
    final user = UserEntity(
      uid: '1',
      displayName: 'John Doe',
      email: 'rami@gmail.com',
      isEmailVerified: true,
      photoUrl: 'https://example.com/photo.jpg',
      isGuest: false,
      createdAt: DateTime.now(),
    );

    blocTest<LoginCubit, LoginState>(
      'emits [LoginState.loading(), LoginState.success(user)] when signInWithGoogle succeeds',
      build: () {
        when(
          () => mockSignInWithGoogleUseCase.call(any()),
        ).thenAnswer((_) async => Right(user));
        return loginCubit;
      },
      act: (_) => loginCubit.signInWithGoogle(),
      expect: () => [isA<LoginLoading>(), isA<LoginSuccess>()],
      verify: (_) {
        verify(() => mockSignInWithGoogleUseCase.call(any())).called(1);
      },
    );
    blocTest<LoginCubit, LoginState>(
      'emits [LoginState.loading(), LoginState.failure(message)] when signInWithGoogle fails',
      build: () {
        when(
          () => mockSignInWithGoogleUseCase.call(any()),
        ).thenAnswer((_) async => const Left(ServerFailure(errorMessage: '')));
        return loginCubit;
      },
      act: (_) => loginCubit.signInWithGoogle(),
      expect: () => [LoginLoading(), const LoginFailure(message: '')],
      verify: (_) {
        verify(() => mockSignInWithGoogleUseCase.call(any())).called(1);
      },
    );
    blocTest<LoginCubit, LoginState>(
      'signInWithGoogle() cancelled → emits [LoginLoading, LoginInitial] (silent)',
      build: () {
        when(
          () => mockSignInWithGoogleUseCase.call(any()),
        ).thenAnswer((_) async => left(const CancelledFailure()));
        return loginCubit;
      },
      act: (cubit) => cubit.signInWithGoogle(),
      expect: () => [
        isA<LoginLoading>(),
        isA<LoginInitial>(), // ← no error shown to user
      ],
      verify: (_) {
        verify(() => mockSignInWithGoogleUseCase.call(any())).called(1);
      },
    );
  });
}
