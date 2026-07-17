import 'package:envied/envied.dart';

part 'env.prod.g.dart';

@Envied(path: '.env.prod', obfuscate: true)
// Prod Environment
abstract class Env {
  @EnviedField(varName: 'TMDB_API_KEY', obfuscate: true)
  static final String tmdbApiKey = _Env.tmdbApiKey;

  // We don't necessarily need to obfuscate the base url, but we can!
  @EnviedField(varName: 'BASE_URL')
  static final String baseUrl = _Env.baseUrl;

  @EnviedField(varName: 'GEMINI_API_KEY', obfuscate: true)
  static final String geminiApiKey = _Env.geminiApiKey;
}
