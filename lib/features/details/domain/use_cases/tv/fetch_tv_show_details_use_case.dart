import 'package:movify/core/domain/use_cases/use_case.dart';
import 'package:movify/core/types/domain_types.dart';
import 'package:movify/features/details/domain/entites/series_details_entity.dart';
import 'package:movify/features/details/domain/repo/series_details_repo.dart';
import 'package:movify/features/details/domain/use_cases/details_params.dart';

class FetchTvShowDetailsUseCase
    implements UseCase<SeriesDetailsEntity, DetailsParams> {
  final SeriesDetailsRepo seriesDetailsRepo;

  FetchTvShowDetailsUseCase({required this.seriesDetailsRepo});
  @override
  SeriesDetailsResult call([DetailsParams? parameter]) =>
      seriesDetailsRepo.fetchSeriesDetails(parameter!.id);
}
