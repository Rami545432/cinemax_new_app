// lib/features/settings/cubit/privacy_options_cubit.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/core/ads/cubits/privacy_options_state.dart';

class PrivacyOptionsCubit extends Cubit<PrivacyOptionsState> {
  PrivacyOptionsCubit() : super(const PrivacyOptionsState.initial());

  Future<void> showPrivacyOptions() async {
    emit(const PrivacyOptionsState.loading());
    try {
      emit(const PrivacyOptionsState.completed());
    } catch (e) {
      emit(PrivacyOptionsState.failure(e.toString()));
    }
  }
}
