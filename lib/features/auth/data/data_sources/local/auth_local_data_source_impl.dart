import 'package:cinemax_app_new/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  static const String _firstTimeKey = 'IS_FIRST_TIME';
  static const String _guestModeKey = 'IS_GUEST_MODE';
  final SharedPreferences sharedPreferences;
  AuthLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<bool> getFirstTime() async =>
      sharedPreferences.getBool(_firstTimeKey) ?? true;

  @override
  Future<void> setFirstTime(bool isFirstTime) async {
    await sharedPreferences.setBool(_firstTimeKey, isFirstTime);
  }

  @override
  Future<bool> getGuestMode() async =>
      sharedPreferences.getBool(_guestModeKey) ?? false;

  @override
  Future<void> setGuestMode(bool isGuest) async {
    await sharedPreferences.setBool(_guestModeKey, isGuest);
  }

  @override
  Future<void> clearGuestMode() async {
    await sharedPreferences.remove(_guestModeKey);
  }
}
