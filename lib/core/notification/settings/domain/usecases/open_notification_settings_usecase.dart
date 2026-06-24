import 'package:movify/core/notification/settings/domain/repos/notification_settings_repo.dart';

class OpenNotificationSettingsUseCase {
  final NotificationSettingsRepo repository;

  OpenNotificationSettingsUseCase(this.repository);

  Future<void> call() async {
    await repository.openDeviceSettings();
  }
}
