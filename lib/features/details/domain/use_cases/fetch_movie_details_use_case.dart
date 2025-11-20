import 'package:cinemax_app_new/core/types/domain_types.dart';
import 'package:cinemax_app_new/core/utils/cubit_parameters/details_params.dart';
import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
import 'package:cinemax_app_new/features/details/domain/entites/movie_details_entity.dart';
import 'package:cinemax_app_new/features/details/domain/repo/details_repo.dart';

class FetchMovieDetailsUseCase
    extends UseCase<MovieDetailsEntity, DetailsParams> {
  final DetailsRepo detailsRepo;

  FetchMovieDetailsUseCase({required this.detailsRepo});
  @override
  MovieDetailsResult call([DetailsParams? params]) async {
    return await detailsRepo.fetchMovieDetails(params!.id, params.cancelToken);
  }
}
