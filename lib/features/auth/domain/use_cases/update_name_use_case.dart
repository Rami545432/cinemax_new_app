import 'package:dartz/dartz.dart';

import '../../../../core/utils/errors/errors.dart';
import '../../../../core/utils/use_case/use_case.dart';
import '../repos/auth_repo.dart';

class UpdateNameUseCase extends UseCase<void, String> {
  final AuthRepo authRepo;

  UpdateNameUseCase({required this.authRepo});
  @override
  Future<Either<Failure, void>> call([String? parameter]) async {
    return await authRepo.updateDisplayName(name: parameter!);
  }
}
