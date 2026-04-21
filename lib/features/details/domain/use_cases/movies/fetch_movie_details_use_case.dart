import 'package:cinemax_app_new/core/types/domain_types.dart';
import 'package:cinemax_app_new/core/utils/cubit_parameters/details_params.dart';
import 'package:cinemax_app_new/features/details/domain/entites/movie_details_entity.dart';
import 'package:cinemax_app_new/features/details/domain/repo/movie_details_repo.dart';
import 'package:cinemax_app_new/shared/domain/use_cases/use_case.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FetchMovieDetailsUseCase
    implements UseCase<MovieDetailsEntity, DetailsParams> {
  final MovieDetailsRepo movieDetailsRepo;

  FetchMovieDetailsUseCase({required this.movieDetailsRepo});
  @override
  MovieDetailsResult call([DetailsParams? params]) =>
      movieDetailsRepo.fetchMovieDetails(params!.id);
}
