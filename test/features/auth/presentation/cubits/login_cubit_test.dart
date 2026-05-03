import 'package:bloc_test/bloc_test.dart';
import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/features/auth/domain/entities/user_entity.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/sign_in_with_google_use_case.dart';
import 'package:cinemax_app_new/features/auth/presentation/cubits/login_cubit.dart';
import 'package:cinemax_app_new/features/auth/presentation/cubits/login_state.dart';
import 'package:cinemax_app_new/shared/domain/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSignInWithGoogleUseCase extends Mock
    implements SignInWithGoogleUseCase {}

class FakeNoParams extends Fake implements NoParams {}

void main() {
  late LoginCubit loginCubit;
  late MockSignInWithGoogleUseCase mockSignInWithGoogleUseCase;

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
        verify(() => mockSignInWithGoogleUseCase.call(NoParams())).called(1);
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
  });
}
