import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseAnalyticsService {
  static final FirebaseAnalyticsService instance = FirebaseAnalyticsService._();
  FirebaseAnalyticsService._();

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  FirebaseAnalytics get analytics => _analytics;

  Future<void> setUserId(String? id) async {
    await _analytics.setUserId(id: id);
  }

  Future<void> setUserProperty({required String name, required String? value}) async {
    await _analytics.setUserProperty(name: name, value: value);
  }

  Future<void> logMovieView({required int movieId, required String title}) async {
    await _analytics.logEvent(
      name: 'movie_viewed',
      parameters: {
        'movie_id': movieId,
        'title': title,
      },
    );
  }

  Future<void> logSearchQuery(String query) async {
    await _analytics.logSearch(searchTerm: query);
  }

  Future<void> logFavoriteToggle({required int movieId, required bool isFavorite}) async {
    await _analytics.logEvent(
      name: 'favorite_toggled',
      parameters: {
        'movie_id': movieId,
        'is_favorite': isFavorite.toString(),
      },
    );
  }

  Future<void> logAdInteraction({required String adUnitId, required String action}) async {
    await _analytics.logEvent(
      name: 'ad_interaction',
      parameters: {
        'ad_unit_id': adUnitId,
        'action': action, // e.g., 'loaded', 'clicked', 'failed'
      },
    );
  }
}
