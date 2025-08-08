part of 'seach_actor_cubit.dart';

@immutable
abstract class SearchActorState {}

class SeachActorInitial extends SearchActorState {}

class SearchActorSuccess extends SearchActorState {
  final List<SearchActorEntity> suggestions;

  SearchActorSuccess({required this.suggestions});
}

class SearchActorFailure extends SearchActorState {
  final String errorMessage;

  SearchActorFailure({required this.errorMessage});
}
