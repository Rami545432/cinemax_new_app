import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/core/domain/use_cases/no_params.dart';
import 'package:movify/features/settings/domain/use_cases/get_is_first_time_use_case.dart';
import 'package:movify/features/settings/domain/use_cases/set_is_first_time_use_case.dart';
import 'package:movify/features/settings/presentation/cubits/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final GetIsFirstTimeUseCase getIsFirstTimeUseCase;
  final SetIsFirstTimeUseCase setIsFirstTimeUseCase;

  SettingsCubit({
    required this.getIsFirstTimeUseCase,
    required this.setIsFirstTimeUseCase,
  }) : super(SettingsUnknown());

  Future<void> checkSettings() async {
    final result = await getIsFirstTimeUseCase(NoParams());
    result.fold(
      (failure) => emit(const SettingsLoaded(isFirstTime: true)),
      (isFirstTime) => emit(SettingsLoaded(isFirstTime: isFirstTime)),
    );
  }

  Future<void> completeOnboarding() async {
    await setIsFirstTimeUseCase(false);
    emit(const SettingsLoaded(isFirstTime: false));
  }
}
