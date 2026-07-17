import 'package:movify/config/env/app_config.dart';
import 'package:movify/config/env/env.prod.dart' as env_prod;
import 'package:movify/firebase_options_prod.dart';
import 'package:movify/main_common.dart';

void main() async {
  final prodConfig = AppConfig(
    environmentName: 'prod',
    tmdbApiKey: env_prod.Env.tmdbApiKey,
    baseUrl: env_prod.Env.baseUrl,
    geminiApiKey: env_prod.Env.geminiApiKey,
    firebaseOptions: DefaultFirebaseOptions.currentPlatform,
  );

  await bootApp(prodConfig);
}
