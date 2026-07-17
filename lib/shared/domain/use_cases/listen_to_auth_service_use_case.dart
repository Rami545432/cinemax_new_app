// import 'package:movify/core/domain/use_cases/no_params.dart';
// import 'package:movify/core/domain/use_cases/stream_use_case.dart';
// import 'package:movify/shared/domain/auth_event.dart';
// import 'package:movify/shared/domain/repos/auth_event_sink.dart';

// class ListenToAuthEventsUseCase implements StreamUseCase<AuthEvent, NoParams> {
//   final AuthEventSink _sink;

//   ListenToAuthEventsUseCase(this._sink);

//   @override
//   Stream<AuthEvent> call([NoParams? params]) => _sink.authEventStream;

//   AuthEvent get currentEvent => _sink.currentEvent;
// }
