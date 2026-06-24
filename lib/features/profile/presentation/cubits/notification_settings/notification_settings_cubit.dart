import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/core/notification/settings/domain/usecases/check_notification_permanently_denied_usecase.dart';
import 'package:movify/core/notification/settings/domain/usecases/get_notification_status_usecase.dart';
import 'package:movify/core/notification/settings/domain/usecases/open_notification_settings_usecase.dart';
import 'package:movify/core/notification/settings/domain/usecases/request_notification_permission_usecase.dart';

part 'notification_settings_state.dart';

class NotificationSettingsCubit extends Cubit<NotificationSettingsState> {
  final GetNotificationStatusUseCase getStatusUseCase;
  final RequestNotificationPermissionUseCase requestPermissionUseCase;
  final OpenNotificationSettingsUseCase openSettingsUseCase;
  final CheckNotificationPermanentlyDeniedUseCase checkPermanentlyDeniedUseCase;

  NotificationSettingsCubit({
    required this.getStatusUseCase,
    required this.requestPermissionUseCase,
    required this.openSettingsUseCase,
    required this.checkPermanentlyDeniedUseCase,
  }) : super(NotificationSettingsInitial());

  Future<void> checkStatus() async {
    emit(NotificationSettingsLoading());
    final isEnabled = await getStatusUseCase();
    emit(NotificationSettingsLoaded(isEnabled: isEnabled));
  }

  Future<void> toggleNotification(bool value) async {
    // We get the current state just to be safe
    final currentState = state;
    if (currentState is! NotificationSettingsLoaded) {
      return;
    }

    if (value) {
      // User wants to turn it ON
      // Request permission
      final isGranted = await requestPermissionUseCase();

      if (isGranted) {
        emit(NotificationSettingsLoaded(isEnabled: true));
      } else {
        // If they denied it, check if it was permanently denied
        final isPermanentlyDenied = await checkPermanentlyDeniedUseCase();
        if (isPermanentlyDenied) {
          // They checked "don't ask again" or the OS enforces it
          await openSettingsUseCase();
        } else {
          // They just cancelled the dialog. Just update state to OFF.
          emit(NotificationSettingsLoaded(isEnabled: false));
        }
      }
    } else {
      // User wants to turn it OFF
      // Because we cannot programmatically revoke OS permissions in Flutter,
      // we must send them to the OS settings to disable it.
      await openSettingsUseCase();
      // We don't change state here either. When they return from settings,
      // the WidgetsBindingObserver in the UI will trigger checkStatus()
    }
  }
}
