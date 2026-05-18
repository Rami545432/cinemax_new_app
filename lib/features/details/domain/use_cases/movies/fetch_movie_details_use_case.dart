import 'package:injectable/injectable.dart';
import 'package:movify/core/domain/use_cases/use_case.dart';
import 'package:movify/core/types/domain_types.dart';
import 'package:movify/features/details/domain/entites/movie_details_entity.dart';
import 'package:movify/features/details/domain/repo/movie_details_repo.dart';
import 'package:movify/features/details/domain/use_cases/details_params.dart';

@lazySingleton
class FetchMovieDetailsUseCase
    implements UseCase<MovieDetailsEntity, DetailsParams> {
  final MovieDetailsRepo movieDetailsRepo;

  FetchMovieDetailsUseCase({required this.movieDetailsRepo});
  @override
  MovieDetailsResult call([DetailsParams? params]) =>
      movieDetailsRepo.fetchMovieDetails(params!.id);
}
