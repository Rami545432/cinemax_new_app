import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/features/auth/domain/entities/user_entity.dart';
import 'package:cinemax_app_new/features/auth/domain/repos/auth_repo.dart';
import 'package:cinemax_app_new/shared/domain/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCurrentUserUseCase implements UseCase<UserEntity?, NoParams> {
  final AuthRepo repository;

  GetCurrentUserUseCase(this.repository);
  @override
  Future<Either<Failure, UserEntity?>> call([NoParams? parameter]) =>
      repository.getCurrentUser();
}
