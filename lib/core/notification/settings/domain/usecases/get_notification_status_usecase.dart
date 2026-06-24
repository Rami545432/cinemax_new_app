import 'package:movify/core/notification/settings/domain/repos/notification_settings_repo.dart';

class GetNotificationStatusUseCase {
  final NotificationSettingsRepo repository;

  GetNotificationStatusUseCase(this.repository);

  Future<bool> call() async => repository.checkPermissionStatus();
}
