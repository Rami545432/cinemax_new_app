// api_service.dart
import 'package:movify/core/network/api/services/tmdb/tmdb_api_service.dart';
import 'package:movify/core/network/api/services/tmdb/tmdb_configration.dart';
import 'package:movify/core/network/client/dio_client.dart';

class ApiService {
  final DioClient dioClient;
  final String _language;
  late final TmdbApiService tmdb;

  ApiService({required this.dioClient, required String language})
    : _language = language {
    tmdb = TmdbApiService(dioClient: dioClient, language: _language);
  }

  String get language => _language;

  void updateLanguage(String language) {
    tmdb.updateLanguage(language);
  }

  static String get baseUrl => TmdbConfig.baseUrl;
}
