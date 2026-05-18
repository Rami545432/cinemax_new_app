import 'package:movify/config/env/app_config.dart';
import 'package:movify/config/env/env.dev.dart' as env_dev;
import 'package:movify/firebase_options_dev.dart';
import 'package:movify/main_common.dart';

void main() async {
  final devConfig = AppConfig(
    environmentName: 'dev',
    tmdbApiKey: env_dev.Env.tmdbApiKey,
    baseUrl: env_dev.Env.baseUrl,
    geminiApiKey: env_dev.Env.geminiApiKey,
    firebaseOptions: DefaultFirebaseOptions.currentPlatform,
  );

  // Boot the app
  await bootApp(devConfig);
}
