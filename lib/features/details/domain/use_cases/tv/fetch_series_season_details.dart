import 'package:injectable/injectable.dart';
import 'package:movify/core/domain/use_cases/use_case.dart';
import 'package:movify/core/types/domain_types.dart';
import 'package:movify/features/details/domain/entites/series_season_details_entitiy.dart';
import 'package:movify/features/details/domain/repo/series_details_repo.dart';

@lazySingleton
class FetchSeriesSeasonDetailsUseCase
    implements UseCase<SeriesSeasonDetailsEntity, int> {
  final SeriesDetailsRepo seriesDetailsRepo;

  FetchSeriesSeasonDetailsUseCase({required this.seriesDetailsRepo});
  @override
  SeriesSeasonDetailsResult call([int? tvid, int? seasonNumber]) =>
      seriesDetailsRepo.fetchSeriesSeasonDetails(tvid!, seasonNumber!);
}
