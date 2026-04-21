abstract interface class AuthLocalDataSource {
  Future<void> setGuestMode(bool isGuest);
  Future<bool> getGuestMode();
  Future<void> clearGuestMode();
  Future<bool> getFirstTime();
  Future<void> setFirstTime(bool isFirstTime);
}
