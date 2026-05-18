import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movify/core/domain/use_cases/no_params.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/features/auth/domain/repos/auth_repo.dart';
import 'package:movify/features/auth/domain/use_cases/disable_guest_mode_use_case.dart';

class MockAuthRepo extends Mock implements AuthRepo {}

void main() {
  late DisableGuestModeUseCase useCase;
  late MockAuthRepo mockAuthRepo;

  setUp(() {
    mockAuthRepo = MockAuthRepo();
    useCase = DisableGuestModeUseCase(mockAuthRepo);
  });

  group('disableGuestMode', () {
    test('should disable guest mode successfully', () async {
      // Arrange
      when(
        () => mockAuthRepo.disableGuestMode(),
      ).thenAnswer((_) async => const Right(null));

      // Act
      final result = await useCase(NoParams());

      // Assert
      expect(result, const Right(null));
      verify(() => mockAuthRepo.disableGuestMode()).called(1);
      verifyNoMoreInteractions(mockAuthRepo);
    });

    test('should return failure when guest mode is not disabled', () async {
      // Arrange
      const failure = ServerFailure(errorMessage: '');
      when(
        () => mockAuthRepo.disableGuestMode(),
      ).thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase(NoParams());

      // Assert
      expect(result, const Left<Failure, void>(failure));
      verify(() => mockAuthRepo.disableGuestMode()).called(1);
      verifyNoMoreInteractions(mockAuthRepo);
    });
  });
}
