import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/features/search/domain/entities/search_actor_entity.dart';
import 'package:cinemax_app_new/features/search/domain/repo/search_repo.dart';
import 'package:cinemax_app_new/shared/domain/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class SearchActorUseCase implements UseCase<List<SearchActorEntity>, String> {
  final SearchRepo searchRepo;

  SearchActorUseCase({required this.searchRepo});
  @override
  Future<Either<Failure, List<SearchActorEntity>>> call([
    String? parameter,
  ]) => searchRepo.searchActor(parameter!);
}
