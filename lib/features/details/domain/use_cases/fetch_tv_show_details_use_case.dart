import 'package:cinemax_app_new/core/types/domain_types.dart';
import 'package:cinemax_app_new/core/utils/cubit_parameters/params.dart';
import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
import 'package:cinemax_app_new/features/details/domain/repo/details_repo.dart';

import '../entites/series_details_entity.dart';

class FetchTvShowDetailsUseCase
    extends UseCase<SeriesDetailsEntity, DetailsParams> {
  final DetailsRepo detailsRepo;

  FetchTvShowDetailsUseCase({required this.detailsRepo});
  @override
  SeriesDetailsResult call([DetailsParams? parameter]) async {
    return await detailsRepo.fetchSeriesDetails(
      parameter!.id,
      parameter.cancelToken,
    );
  }
}
