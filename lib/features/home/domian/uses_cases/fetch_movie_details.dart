import 'package:dartz/dartz.dart';

import '../../../../core/utils/cubit_parameters/params.dart';
import '../../../../core/utils/errors/errors.dart';
import '../../../../core/utils/use_case/use_case.dart';
import '../../../../models/movie_details_model/movie_details_model.dart';
import '../repos/home_repo.dart';

class FetchMovieDetailsUseCase
    extends UseCase<MovieDetailsModel, DetailsParams> {
  final HomeRepo homeRepo;

  FetchMovieDetailsUseCase({required this.homeRepo});
  @override
  // ignore: avoid_renaming_method_parameters
  Future<Either<Failure, MovieDetailsModel>> call([DetailsParams? params]) {
    return homeRepo.fetchMoviesDetails(params!.id, params.cancelToken);
  }
}
