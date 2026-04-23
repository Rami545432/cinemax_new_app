import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/features/auth/domain/entities/user_entity.dart';
import 'package:cinemax_app_new/features/auth/domain/repos/auth_repo.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/enable_guest_mode_use_case.dart';
import 'package:cinemax_app_new/shared/domain/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepo extends Mock implements AuthRepo {}

void main() {
  late MockAuthRepo mockRepo;
  late EnableGuestModeUseCase useCase;
  setUp(() {
    mockRepo = MockAuthRepo();
    useCase = EnableGuestModeUseCase(mockRepo);
  });

  // Step 3 — the actual test
  group('enable guest mode use case', () {
    test('should retrun true when user is authenticated', () async {
      // Arrange — tell the mock what to return
      final fakeuser = UserEntity.guest();
      when(
        () => mockRepo.enableGuestMode(),
      ).thenAnswer((_) async => Right(fakeuser));

      // Act — call the use case
      final result = await useCase();

      // Assert — check what came back
      // ignore: inference_failure_on_instance_creation
      expect(result, Right(fakeuser));
    });

    test('should return Failure when repo returns Failure', () async {
      // Arrange — tell the mock what to return
      final failure = ServerFailure(errorMessage: 'error');
      when(
        () => mockRepo.enableGuestMode(),
      ).thenAnswer((_) async => Left(failure));

      // Act — call the use case
      final result = await useCase(NoParams());

      // Assert — check what came back
      // ignore: inference_failure_on_instance_creation
      expect(result, isA<Left>());
    });
  });
}
