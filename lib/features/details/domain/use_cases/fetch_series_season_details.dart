import 'package:cinemax_app_new/core/types/domain_types.dart';
import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
import 'package:cinemax_app_new/features/details/domain/entites/series_season_details_entitiy.dart';
import 'package:cinemax_app_new/features/details/domain/repo/details_repo.dart';
import 'package:dio/dio.dart';

class FetchSeriesSeasonDetailsUseCase
    extends UseCase<SeriesSeasonDetailsEntitiy, int> {
  final DetailsRepo detailsRepo;

  FetchSeriesSeasonDetailsUseCase({required this.detailsRepo});
  @override
  SeriesSeasonDetailsResult call([
    int? tvid,
    int? seasonNumber,
    CancelToken? cancelToken,
  ]) async {
    return await detailsRepo.fetchSeriesSeasonDetails(
      tvid!,
      seasonNumber!,
      cancelToken,
    );
  }
}
