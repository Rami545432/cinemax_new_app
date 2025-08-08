import 'dart:developer';
import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  final String _apiKey = '23e981c4511a42f47649472bd8b1bd50';
  final String _baseUrl = 'https://api.themoviedb.org/3';
  final String _additionalData =
      'append_to_response=credits,videos,images&include_image_language=en,null';

  String _buildUrl(String path, [Map<String, dynamic>? queryParams]) {
    final uri = Uri.parse('$_baseUrl/$path').replace(
      queryParameters: {
        'api_key': _apiKey,
        ...?queryParams,
        'without_genres': '10763,10764,10767,10766,10749',
      },
    );
    log(uri.toString());
    return uri.toString();
  }

  // 🎬 Popular (with genre)
  Future<Map<String, dynamic>> getPopular({
    required dynamic genreId,
    String type = 'movie',
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    final url = _buildUrl('discover/$type', {
      'with_genres': genreId.toString(),

      'page': page.toString(),
    });

    return (await dio.get(url, cancelToken: cancelToken)).data;
  }

  // 🔍 Search movie
  Future<Map<String, dynamic>> searchRequest({
    required String query,
    String type = 'movie',
    CancelToken? cancelToken,
  }) async {
    final url = _buildUrl('search/$type', {'query': query});

    return (await dio.get(url, cancelToken: cancelToken)).data;
  }

  // 👤 Search actor
  Future<Map<String, dynamic>> searchActor({
    required String query,
    CancelToken? cancelToken,
  }) async {
    final url = _buildUrl('search/person', {'query': query});

    return (await dio.get(url, cancelToken: cancelToken)).data;
  }

  Future<Map<String, dynamic>> getDetails({
    required int id,
    String type = 'movie',
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    final url =
        '${_buildUrl('$type/$id', {'language': 'en-US', 'page': page.toString()})}&$_additionalData';

    return (await dio.get(url, cancelToken: cancelToken)).data;
  }

  Future<Map<String, dynamic>> getGeneralTv({
    required String type,
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    final url = _buildUrl('discover/$type', {
      'without_genres': '10763,10764,10767,10766,10749',
      'page': page.toString(),
    });

    return (await dio.get(url, cancelToken: cancelToken)).data;
  }

  // 📺 Season details
  Future<Map<String, dynamic>> getSeasonDetails({
    required int tvid,
    required num season,
    CancelToken? cancelToken,
  }) async {
    final url = '${_buildUrl('tv/$tvid/season/$season')}&$_additionalData';
    return (await dio.get(url, cancelToken: cancelToken)).data;
  }

  // 🎯 Recommendations
  Future<Map<String, dynamic>> getRecommendations({
    required int movieId,
    String type = 'movie',
    CancelToken? cancelToken,
  }) async {
    final url = _buildUrl('$type/$movieId/recommendations', {
      'without_genres': '10749',
    });
    return (await dio.get(url, cancelToken: cancelToken)).data;
  }

  // 📈 Trending
  Future<Map<String, dynamic>> getTrending({
    String type = 'movie',
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    final url = _buildUrl('trending/$type/week', {'page': page.toString()});
    return (await dio.get(url, cancelToken: cancelToken)).data;
  }

  // ⭐ Top Rated
  Future<Map<String, dynamic>> getTopRated({
    required String type,
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    final url = _buildUrl('$type/top_rated', {'page': page.toString()});

    return (await dio.get(url, cancelToken: cancelToken)).data;
  }

  Future<Map<String, dynamic>> getAiringToday({
    required String type,
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    final url = _buildUrl('$type/airing_today', {'page': page.toString()});
    return (await dio.get(url, cancelToken: cancelToken)).data;
  }

  Future<Map<String, dynamic>> getUpcoming({
    required String type,
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    final url = _buildUrl('$type/upcoming', {'page': page.toString()});
    return (await dio.get(url, cancelToken: cancelToken)).data;
  }

  Future<Map<String, dynamic>> getNowPlaying({
    String type = 'movie',
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    final url = _buildUrl('movie/now_playing', {'page': page.toString()});
    log(url);
    return (await dio.get(url, cancelToken: cancelToken)).data;
  }
}
