import 'package:flutter_bloc/flutter_bloc.dart';

extension SafeEmitExtension<T> on Cubit<T> {
  void safeEmit(T state) {
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    if (!isClosed) emit(state);
  }
}
