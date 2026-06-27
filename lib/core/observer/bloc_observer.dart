import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/core/utils/app_logger.dart';

class SimpleBlocObserver extends BlocObserver {
  // @override
  // void onChange(BlocBase bloc, Change change) {
  //   super.onChange(bloc, change);
  //   log(change.toString());
  // }

  @override
  void onClose(BlocBase<void> bloc) {
    super.onClose(bloc);
    AppLogger.log('closed  $bloc');
  }

  @override
  void onCreate(BlocBase<void> bloc) {
    super.onCreate(bloc);
    AppLogger.log('created  $bloc');
  }

  // @override
  // void onError(BlocBase<void> bloc, Object error, StackTrace stackTrace) {
  //   super.onError(bloc, error, stackTrace);
  //   log('error  $error');
  // }

  // @override
  // void onTransition(
  //   Bloc<dynamic, dynamic> bloc,
  //   Transition<dynamic, dynamic> transition,
  // ) {
  //   super.onTransition(bloc, transition);
  //   log('transition  $transition');
  // }
}
