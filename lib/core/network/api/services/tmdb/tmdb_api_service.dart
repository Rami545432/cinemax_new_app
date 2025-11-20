// lib/core/network/api/services/tmdb/tmdb_api_service.dart
import 'package:cinemax_app_new/core/network/api/services/tmdb/tmdb_base_client.dart';
import 'package:cinemax_app_new/core/network/api/services/tmdb/tmdb_configration.dart';
import 'package:cinemax_app_new/core/network/api/services/tmdb/tmdb_content_api.dart';
import 'package:cinemax_app_new/core/network/api/services/tmdb/tmdb_details_api.dart';
import 'package:cinemax_app_new/core/network/api/services/tmdb/tmdb_search_api.dart';
import 'package:dio/dio.dart';

/// Main TMDB API service that aggregates all domain-specific APIs
class TmdbApiService {
  final TmdbBaseClient _client;

  // Domain-specific API services
  late final TmdbContentApi content; // Unified for movies & TV
  late final TmdbSearchApi search;
  late final TmdbDetailsApi details;

  TmdbApiService({required Dio dio, required String language})
    : _client = TmdbBaseClient(dio: dio, language: language) {
    content = TmdbContentApi(_client);
    search = TmdbSearchApi(_client);
    details = TmdbDetailsApi(_client);
  }

  String get language => _client.language;

  void updateLanguage(String language) {
    _client.updateLanguage(language);
  }

  static String get baseUrl => TmdbConfig.baseUrl;
}
