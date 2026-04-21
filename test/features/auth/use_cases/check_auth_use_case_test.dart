import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/features/auth/domain/repos/auth_repo.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/check_auth_statues_use_case.dart';
import 'package:cinemax_app_new/shared/domain/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepo extends Mock implements AuthRepo {}

void main() {
  late MockAuthRepo mockRepo;
  late CheckAuthStatusUseCase useCase;
  setUp(() {
    mockRepo = MockAuthRepo();
    useCase = CheckAuthStatusUseCase(mockRepo);
  });

  // Step 3 — the actual test
  test('should retrun true when user is authenticated', () async {
    // Arrange — tell the mock what to return

    when(
      () => mockRepo.checkAuthStatus(),
    ).thenAnswer((_) async => const Right(true));

    // Act — call the use case
    final result = await useCase();

    // Assert — check what came back
    // ignore: inference_failure_on_instance_creation
    expect(result, const Right(true));
  });

  test('should return Failure when repo returns Failure', () async {
    // Arrange — tell the mock what to return

    when(
      () => mockRepo.checkAuthStatus(),
    ).thenAnswer((_) async => Left(ServerFailure(errorMessage: '')));

    // Act — call the use case
    final result = await useCase(NoParams());

    // Assert — check what came back
    // ignore: inference_failure_on_instance_creation
    expect(result, isA<Left>());
  });
}
