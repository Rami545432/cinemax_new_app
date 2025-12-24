import 'package:cinemax_app_new/core/network/utils/safe_emit_state.dart';
import 'package:cinemax_app_new/features/details/domain/use_cases/fetch_collections_use_case.dart';
import 'package:cinemax_app_new/features/details/presentation/cubits/fetch_collection_cubit/fetch_collection_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchCollectionCubit extends Cubit<FetchCollectionState> {
  FetchCollectionCubit({required this.fetchCollectionsUseCase})
    : super(FetchCollectionInitial());
  final FetchCollectionsUseCase fetchCollectionsUseCase;
  Future<void> fetchCollection(int? collectionId, int? movieId) async {
    if (collectionId == null) {
      return;
    }
    emit(FetchCollectionLoading());
    var data = await fetchCollectionsUseCase.call(collectionId);

    data.fold(
      (failure) {
        emit(FetchCollectionFailure(message: failure.errorMessage));
      },
      (collection) {
        collection.collectionParts.removeWhere(
          (element) => element.id == movieId,
        );
        safeEmit(FetchCollectionSuccess(collection: collection));
      },
    );
  }
}
