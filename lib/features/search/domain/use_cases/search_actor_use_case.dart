import 'package:dartz/dartz.dart';
import 'package:movify/core/domain/use_cases/use_case.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/features/search/domain/entities/search_actor_entity.dart';
import 'package:movify/features/search/domain/repo/search_repo.dart';

class SearchActorUseCase implements UseCase<List<SearchActorEntity>, String> {
  final SearchRepo searchRepo;

  SearchActorUseCase({required this.searchRepo});
  @override
  Future<Either<Failure, List<SearchActorEntity>>> call([String? parameter]) =>
      searchRepo.searchActor(parameter!);
}
