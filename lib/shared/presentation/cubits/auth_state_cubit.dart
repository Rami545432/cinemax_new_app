// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:movify/shared/domain/auth_event.dart';
// import 'package:movify/shared/domain/repos/auth_event_sink.dart';

// class AuthStateCubit extends Cubit<AuthEvent> implements AuthEventSink {
//   AuthStateCubit() : super(const AuthEventUnknown());

//   /// Called only by AuthRepoImpl via the AuthEventSink interface.
//   @override
//   void addEvent(AuthEvent event) => emit(event);

//   /// Subscribers listen via authEventStream.
//   /// In bloc 9.x, Cubit.stream replays the last state to new listeners.
//   /// currentEvent is only used for synchronous checks (e.g. router redirect).
//   @override
//   Stream<AuthEvent> get authEventStream => stream;

//   /// Current event — useful for synchronous checks (e.g. router redirect).
//   @override
//   AuthEvent get currentEvent => state;
// }
