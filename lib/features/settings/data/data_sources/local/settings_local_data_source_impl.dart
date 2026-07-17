import 'package:movify/features/settings/data/data_sources/local/settings_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  static const String _firstTimeKey = 'IS_FIRST_TIME';
  final SharedPreferences sharedPreferences;

  SettingsLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<bool> getIsFirstTime() async =>
      sharedPreferences.getBool(_firstTimeKey) ?? true;

  @override
  Future<void> setIsFirstTime(bool isFirstTime) async {
    await sharedPreferences.setBool(_firstTimeKey, isFirstTime);
  }
}
