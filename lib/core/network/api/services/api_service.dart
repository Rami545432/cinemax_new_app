// api_service.dart (update constructor)
import 'package:cinemax_app_new/core/network/api/services/tmdb/tmdb_api_service.dart';
import 'package:cinemax_app_new/core/network/api/services/tmdb/tmdb_configration.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  final String _language;
  late final TmdbApiService tmdb;

  ApiService({required this.dio, required String language})
    : _language = language {
    tmdb = TmdbApiService(dio: dio, language: _language);
  }

  String get language => _language;

  void updateLanguage(String language) {
    // optional: keep for backward compatibility, but prefer provider usage
    tmdb.updateLanguage(language);
  }

  static String get baseUrl => TmdbConfig.baseUrl;
}
