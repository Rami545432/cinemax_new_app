import 'package:cinemax_app_new/core/types/domain_types.dart';
import 'package:cinemax_app_new/features/details/domain/entites/series_season_details_entitiy.dart';
import 'package:cinemax_app_new/features/details/domain/repo/series_details_repo.dart';
import 'package:cinemax_app_new/shared/domain/use_cases/use_case.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FetchSeriesSeasonDetailsUseCase
    implements UseCase<SeriesSeasonDetailsEntity, int> {
  final SeriesDetailsRepo seriesDetailsRepo;

  FetchSeriesSeasonDetailsUseCase({required this.seriesDetailsRepo});
  @override
  SeriesSeasonDetailsResult call([int? tvid, int? seasonNumber]) =>
      seriesDetailsRepo.fetchSeriesSeasonDetails(tvid!, seasonNumber!);
}
