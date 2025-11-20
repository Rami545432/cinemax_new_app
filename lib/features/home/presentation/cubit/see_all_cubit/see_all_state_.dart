part of 'see_all_cubit.dart';

@immutable
abstract class SeeAllState extends Equatable {}

class SeeallcubitInitial extends SeeAllState {
  @override
  List<Object?> get props => [];
}

class SeeAllSuccess extends SeeAllState {
  final List<BaseCardModel> data;

  SeeAllSuccess({required this.data});
  @override
  List<Object?> get props => [data];
}

class SeeAllLoading extends SeeAllState {
  @override
  List<Object?> get props => [];
}

class SeeAllFailure extends SeeAllState {
  final String errMesaage;

  SeeAllFailure({required this.errMesaage});
  @override
  List<Object?> get props => [errMesaage];
}

class SeeAllPaginationLoading extends SeeAllState {
  @override
  List<Object?> get props => [];
}
