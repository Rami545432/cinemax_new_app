abstract interface class SettingsLocalDataSource {
  Future<bool> getIsFirstTime();
  Future<void> setIsFirstTime(bool isFirstTime);
}
