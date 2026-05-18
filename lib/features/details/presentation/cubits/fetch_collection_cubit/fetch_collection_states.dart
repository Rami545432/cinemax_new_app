import 'package:equatable/equatable.dart';
import 'package:movify/features/details/domain/entites/collection_entity.dart';

abstract class FetchCollectionState extends Equatable {}

class FetchCollectionInitial extends FetchCollectionState {
  @override
  List<Object?> get props => [];
}

class FetchCollectionLoading extends FetchCollectionState {
  @override
  List<Object?> get props => [];
}

class FetchCollectionSuccess extends FetchCollectionState {
  final CollectionEntity collection;
  FetchCollectionSuccess({required this.collection});
  @override
  List<Object?> get props => [collection];
}

class FetchCollectionFailure extends FetchCollectionState {
  final String message;
  FetchCollectionFailure({required this.message});
  @override
  List<Object?> get props => [message];
}
