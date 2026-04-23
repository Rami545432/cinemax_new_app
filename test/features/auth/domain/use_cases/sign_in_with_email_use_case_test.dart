import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/features/auth/domain/entities/user_entity.dart';
import 'package:cinemax_app_new/features/auth/domain/repos/auth_repo.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/sign_in_with_google_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepo extends Mock implements AuthRepo {}

void main() {
  late MockAuthRepo mockRepo;
  late SignInWithGoogleUseCase useCase;
  setUp(() {
    mockRepo = MockAuthRepo();
    useCase = SignInWithGoogleUseCase(mockRepo);
  });

  // Step 3 — the actual test
  test('should user sign in with google', () async {
    // Arrange — tell the mock what to return
    final tuser = UserEntity(
      uid: 'user-123',
      email: 'test@cinemax.com',
      displayName: 'Test User',
      isGuest: false,
      photoUrl: '',
      isEmailVerified: false,
      createdAt: DateTime.now(),
    );

    when(
      () => mockRepo.signInWithGoogle(),
    ).thenAnswer((_) async => Right(tuser));

    // Act — call the use case
    final result = await useCase();

    // Assert — check what came back
    // ignore: inference_failure_on_instance_creation
    expect(result, isA<Right>());
  });

  test('should return Failure when repo returns Failure', () async {
    // Arrange — tell the mock what to return

    when(
      () => mockRepo.signInWithGoogle(),
    ).thenAnswer((_) async => Left(ServerFailure(errorMessage: '')));

    // Act — call the use case
    final result = await useCase();

    // Assert — check what came back
    // ignore: inference_failure_on_instance_creation
    expect(result, isA<Left>());
  });
}
