import 'package:cinemax_app_new/core/utils/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../entities/user_entity.dart';
import '../repos/auth_repo.dart';

class SignUpWithEmailUseCase implements UseCase<UserEntity, SignUpParams> {
  final AuthRepo repository;

  SignUpWithEmailUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call([SignUpParams? parameter]) async {
    return await repository.signUpWithEmail(
      email: parameter?.email ?? '',
      password: parameter?.password ?? '',
      displayName: parameter?.displayName ?? '',
    );
  }
}

class SignUpParams extends Equatable {
  final String email;
  final String password;
  final String displayName;

  const SignUpParams({
    required this.email,
    required this.password,
    required this.displayName,
  });

  @override
  List<Object?> get props => [email, password, displayName];
}
