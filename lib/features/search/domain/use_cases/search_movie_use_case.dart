import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/features/search/domain/repo/search_repo.dart';
import 'package:cinemax_app_new/shared/domain/entites/movie_entity.dart';
import 'package:cinemax_app_new/shared/domain/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SearchMovieUseCase implements UseCase<List<MovieEntity>, String> {
  final SearchRepo searchRepo;

  const SearchMovieUseCase({required this.searchRepo});
  @override
  Future<Either<Failure, List<MovieEntity>>> call([String? parameter]) =>
      searchRepo.searchMovies(parameter!);
}
