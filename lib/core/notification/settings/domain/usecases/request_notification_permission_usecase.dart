import 'package:movify/core/notification/settings/domain/repos/notification_settings_repo.dart';

class RequestNotificationPermissionUseCase {
  final NotificationSettingsRepo repository;

  RequestNotificationPermissionUseCase(this.repository);

  Future<bool> call() async => repository.requestPermission();
}
