import 'package:cinemax_app_new/core/network/api/services/tmdb/tmdb_api_service.dart';
import 'package:dio/dio.dart';

class TestApiService {
  final Dio dio;
  String _language;
  late final TmdbApiService tmdb;
  TestApiService({required this.dio, required String language})
    : _language = language {
    tmdb = TmdbApiService(dio: dio, language: language);
  }
  String get language => _language;
  void updateLanguage(String language) {
    _language = language;
    tmdb.updateLanguage(language);
  }
}
