import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entities/search_actor_entity.dart';
import '../../../../domain/use_case/search_actor_use_case.dart';

part 'seach_actor_state.dart';

class SearchActorCubit extends Cubit<SearchActorState> {
  SearchActorCubit(this.searchActorUseCase) : super(SeachActorInitial());
  final SearchActorUseCase searchActorUseCase;
  Future<void> searchActor(String query) async {
    var results = await searchActorUseCase.call(query);
    results.fold(
      (failure) {
        emit(SearchActorFailure(errorMessage: failure.errorMessage));
      },
      (suggestions) {
        emit(SearchActorSuccess(suggestions: suggestions));
      },
    );
  }
}
