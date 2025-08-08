import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/cubit_parameters/params.dart';
import '../../../../core/utils/errors/errors.dart';
import '../../../../core/utils/use_case/use_case.dart';
import '../entites/entity.dart';
import '../repos/home_repo.dart';

class FetchNowPlayingMovieUseCase
    extends UseCase<List<MovieEntity>, NowPlayingParams> {
  final HomeRepo homeRepo;

  FetchNowPlayingMovieUseCase({required this.homeRepo});
  @override
  // ignore: avoid_renaming_method_parameters
  Future<Either<Failure, List<MovieEntity>>> call([
    NowPlayingParams? params,
    int? page,
    CancelToken? cancelToken,
  ]) {
    return homeRepo.fetchNowPlayingMovies(
      page: page!,
      cancelToken: cancelToken,
    );
  }
}
