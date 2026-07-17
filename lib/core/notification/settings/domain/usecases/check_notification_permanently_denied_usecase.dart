import 'package:movify/core/notification/settings/domain/repos/notification_settings_repo.dart';

class CheckNotificationPermanentlyDeniedUseCase {
  final NotificationSettingsRepo repository;

  CheckNotificationPermanentlyDeniedUseCase(this.repository);

  Future<bool> call() async => repository.checkIsPermanentlyDenied();
}
