import 'package:cinemax_app_new/core/utils/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/cubit_parameters/params.dart';
import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
import 'package:cinemax_app_new/features/series/data/models/series_details_model/series_details_model.dart';
import 'package:cinemax_app_new/features/series/domain/repos/series_repo.dart';
import 'package:dartz/dartz.dart';

class FetchTvShowDetailsUseCase
    extends UseCase<SeriesDetailsModel, DetailsParams> {
  final SeriesRepo seriesRepo;

  FetchTvShowDetailsUseCase({required this.seriesRepo});
  @override
  Future<Either<Failure, SeriesDetailsModel>> call([
    DetailsParams? parameter,
  ]) async {
    return await seriesRepo.fetchTvShowDetail(
      tvid: parameter!.id,
      cancelToken: parameter.cancelToken,
    );
  }
}
