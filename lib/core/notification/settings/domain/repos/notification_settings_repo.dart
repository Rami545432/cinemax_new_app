abstract class NotificationSettingsRepo {
  Future<bool> checkPermissionStatus();
  Future<bool> requestPermission();
  Future<void> openDeviceSettings();
  Future<bool> checkIsPermanentlyDenied();
}
