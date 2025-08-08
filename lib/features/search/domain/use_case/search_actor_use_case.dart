import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/errors/errors.dart';
import '../../../../core/utils/use_case/use_case.dart';
import '../entities/search_actor_entity.dart';
import '../repo/search_repo.dart';

class SearchActorUseCase extends UseCase<List<SearchActorEntity>, String> {
  final SearchRepo searchRepo;

  SearchActorUseCase({required this.searchRepo});
  @override
  Future<Either<Failure, List<SearchActorEntity>>> call([
    String? parameter,
    CancelToken? cancelToken,
  ]) {
    return searchRepo.searchActor(parameter!, cancelToken);
  }
}
