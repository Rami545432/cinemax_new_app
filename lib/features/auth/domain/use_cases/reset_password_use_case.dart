import 'package:cinemax_app_new/core/utils/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
import 'package:cinemax_app_new/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class ResetPasswordUseCase implements UseCase<void, ResetPasswordParams> {
  final AuthRepo repository;

  ResetPasswordUseCase(this.repository);
  @override
  Future<Either<Failure, void>> call([ResetPasswordParams? parameter]) async {
    return await repository.resetPassword(parameter?.email ?? '');
  }
}

class ResetPasswordParams extends Equatable {
  final String email;
  const ResetPasswordParams({required this.email});
  @override
  List<Object?> get props => [email];
}
