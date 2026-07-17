import 'package:dartz/dartz.dart';
import 'package:movify/core/domain/use_cases/no_params.dart';
import 'package:movify/core/domain/use_cases/use_case.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/features/auth/domain/entities/user_entity.dart';
import 'package:movify/features/auth/domain/repos/auth_repo.dart';

class GetCurrentUserUseCase implements UseCase<UserEntity?, NoParams> {
  final AuthRepo repository;

  GetCurrentUserUseCase(this.repository);
  @override
  Future<Either<Failure, UserEntity?>> call([NoParams? parameter]) =>
      repository.getCurrentUser();
}
