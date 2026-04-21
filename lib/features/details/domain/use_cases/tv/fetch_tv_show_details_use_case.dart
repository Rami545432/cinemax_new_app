import 'package:cinemax_app_new/core/types/domain_types.dart';
import 'package:cinemax_app_new/core/utils/cubit_parameters/params.dart';
import 'package:cinemax_app_new/features/details/domain/entites/series_details_entity.dart';
import 'package:cinemax_app_new/features/details/domain/repo/series_details_repo.dart';
import 'package:cinemax_app_new/shared/domain/use_cases/use_case.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FetchTvShowDetailsUseCase
    implements UseCase<SeriesDetailsEntity, DetailsParams> {
  final SeriesDetailsRepo seriesDetailsRepo;

  FetchTvShowDetailsUseCase({required this.seriesDetailsRepo});
  @override
  SeriesDetailsResult call([DetailsParams? parameter]) =>
      seriesDetailsRepo.fetchSeriesDetails(parameter!.id);
}
