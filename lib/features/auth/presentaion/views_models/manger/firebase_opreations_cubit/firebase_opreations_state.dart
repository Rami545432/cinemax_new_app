part of 'firebase_opreations_cubit.dart';

@immutable
abstract class FirebaseOpreationsState {}

class FirebaseOpreationsInitial extends FirebaseOpreationsState {}

class FirebaseOpreationsSuccess extends FirebaseOpreationsState {}

class FirebaseOpreationsFailure extends FirebaseOpreationsState {
  final String errMessage;

  FirebaseOpreationsFailure({required this.errMessage});
}

class FirebaseOpreationsLoading extends FirebaseOpreationsState {}
