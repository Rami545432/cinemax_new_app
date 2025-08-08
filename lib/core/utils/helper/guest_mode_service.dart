import 'package:shared_preferences/shared_preferences.dart';

class GuestModeService {
  static const String _guestModeKey = 'guest';
  static Future<void> setGuestMode(bool isGuestMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_guestModeKey, isGuestMode);
  }

  static Future<bool> getGuestMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_guestModeKey) ?? false;
  }
}
