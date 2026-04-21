import 'package:cinemax_app_new/features/settings/domain/use_cases/get_is_first_time_use_case.dart';
import 'package:cinemax_app_new/features/settings/domain/use_cases/set_is_first_time_use_case.dart';
import 'package:cinemax_app_new/features/settings/presentation/cubits/settings_state.dart';
import 'package:cinemax_app_new/shared/domain/use_cases/use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
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
