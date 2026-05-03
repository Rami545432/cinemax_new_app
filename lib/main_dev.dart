import 'package:cinemax_app_new/config/env/app_config.dart';
import 'package:cinemax_app_new/config/env/env.dev.dart' as env_dev;
import 'package:cinemax_app_new/firebase_options_dev.dart';
import 'package:cinemax_app_new/main_common.dart';

void main() async {
  final devConfig = AppConfig(
    environmentName: 'dev',
    tmdbApiKey: env_dev.Env.tmdbApiKey,
    baseUrl: env_dev.Env.baseUrl,
    geminiApiKey: env_dev.Env.geminiApiKey,
    firebaseOptions: DefaultFirebaseOptionsDev.currentPlatform,
  );

  // Boot the app
  await bootApp(devConfig);
}
