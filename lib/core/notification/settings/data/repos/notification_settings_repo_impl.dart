import 'package:movify/core/notification/settings/domain/repos/notification_settings_repo.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationSettingsRepoImpl implements NotificationSettingsRepo {
  @override
  Future<bool> checkPermissionStatus() async {
    final status = await Permission.notification.status;
    return status.isGranted;
  }

  @override
  Future<bool> requestPermission() async {
    final status = await Permission.notification.request();
    return status.isGranted;
  }

  @override
  Future<void> openDeviceSettings() async {
    await openAppSettings();
  }

  @override
  Future<bool> checkIsPermanentlyDenied() async =>
      Permission.notification.isPermanentlyDenied;
}
