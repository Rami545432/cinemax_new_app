import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:movify/core/utils/app_logger.dart';
import 'package:package_info_plus/package_info_plus.dart';

class RemoteConfigService {
  static final RemoteConfigService instance = RemoteConfigService._();
  RemoteConfigService._();

  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;
  String _currentAppVersion = '1.0.0';

  Future<void> init() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      _currentAppVersion = packageInfo.version;

      await _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(minutes: 1),
          minimumFetchInterval: const Duration(hours: 1),
        ),
      );

      // Set default values before fetching from the server
      await _remoteConfig.setDefaults(const {
        'is_maintenance_mode': false,
        'maintenance_message':
            'We are currently undergoing maintenance. Please check back soon.',
        'min_required_version': '1.0.0',
        'show_ads': true,
        'ad_frequency_clicks': 8,
        'enable_new_home_ui': false,
        'show_announcement_banner': false,
        'announcement_text': '',
      });

      // Fetch and activate values
      await _remoteConfig.fetchAndActivate();
      AppLogger.log('✅ RemoteConfig initialized successfully.');
    } catch (e, st) {
      AppLogger.error('❌ RemoteConfig fetch failed: $e', e, st);
    }
  }

  // Version check logic
  bool get isUpdateRequired {
    final minVersion = minRequiredVersion;
    // Simple semver comparison (assuming format x.y.z)
    final currentParts = _currentAppVersion
        .split('.')
        .map((e) => int.tryParse(e) ?? 0)
        .toList();
    final minParts = minVersion
        .split('.')
        .map((e) => int.tryParse(e) ?? 0)
        .toList();

    for (int i = 0; i < 3; i++) {
      final current = i < currentParts.length ? currentParts[i] : 0;
      final min = i < minParts.length ? minParts[i] : 0;
      if (current < min) {
        return true;
      }
      if (current > min) {
        return false;
      }
    }
    return false;
  }

  // Getters for keys
  bool get isMaintenanceMode => _remoteConfig.getBool('is_maintenance_mode');
  String get maintenanceMessage =>
      _remoteConfig.getString('maintenance_message');
  String get minRequiredVersion =>
      _remoteConfig.getString('min_required_version');
  bool get showAds => _remoteConfig.getBool('show_ads');
  int get adFrequencyClicks => _remoteConfig.getInt('ad_frequency_clicks');
  bool get enableNewHomeUi => _remoteConfig.getBool('enable_new_home_ui');
  bool get showAnnouncementBanner =>
      _remoteConfig.getBool('show_announcement_banner');
  String get announcementText => _remoteConfig.getString('announcement_text');
}
