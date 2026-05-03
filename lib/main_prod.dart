import 'package:cinemax_app_new/config/env/app_config.dart';
import 'package:cinemax_app_new/config/env/env.prod.dart' as env_prod;
import 'package:cinemax_app_new/firebase_options_prod.dart';
import 'package:cinemax_app_new/main_common.dart';

void main() async {
  final prodConfig = AppConfig(
    environmentName: 'prod',
    tmdbApiKey: env_prod.Env.tmdbApiKey,
    baseUrl: env_prod.Env.baseUrl,
    geminiApiKey: env_prod.Env.geminiApiKey,
    firebaseOptions: DefaultFirebaseOptionsProd.currentPlatform,
  );

  // Boot the app
  await bootApp(prodConfig);
}
