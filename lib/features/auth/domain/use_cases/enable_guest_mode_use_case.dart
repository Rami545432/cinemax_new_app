import 'package:cinemax_app_new/core/utils/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
import 'package:cinemax_app_new/features/auth/domain/entities/user_entity.dart';
import 'package:cinemax_app_new/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';

class EnableGuestModeUseCase implements UseCase<UserEntity, NoParams> {
  final AuthRepo repository;
  EnableGuestModeUseCase(this.repository);
  @override
  Future<Either<Failure, UserEntity>> call([NoParams? parameter]) async {
    return await repository.enableGuestMode();
  }
}
