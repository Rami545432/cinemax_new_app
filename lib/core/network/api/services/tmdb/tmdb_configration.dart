// lib/core/network/api/services/tmdb/tmdb_config.dart
class TmdbConfig {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String includeImageLanguage = 'en,null';
  static const String includeVideoLanguage = 'en,null';
  static const String appendToResponse =
      'credits,videos,images,translations,keywords,watch/providers,external_ids,reviews,images,keywords';

  // Excluded genres (News, Talk, Reality, Soap, Romance)
  static const String excludedGenres = '10763,10764,10767,10766,10749';
  static const String excludedRomanceGenre = '10749';

  /// Get additional data query string for details endpoints
  static String get additionalData =>
      'append_to_response=$appendToResponse&include_image_language=$includeImageLanguage&include_video_language=$includeVideoLanguage';

  /// Default query parameters for TMDB requests
  static Map<String, dynamic> get defaultParams => {
    'without_genres': excludedGenres,
  };
}
