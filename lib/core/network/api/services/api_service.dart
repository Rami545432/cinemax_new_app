import 'dart:developer';
import 'package:cinemax_app_new/core/network/config/app_dio.dart';
import 'package:cinemax_app_new/core/types/api_types.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

class ApiService {
  final Dio dio;
  String _language;

  ApiService(this.dio, this._language);
  String get language => _language;
  void updateLanguage(String language) {
    _language = language;
  }

  // final String _apiKey = '23e981c4511a42f47649472bd8b1bd50';
  static final String _baseUrl = 'https://api.themoviedb.org/3';
  static final String _includeImageLanguage = 'en,null';
  static final String _includeVideoLanguage = 'en,null';
  static final String _appendToResponse =
      'credits,videos,images,translations,keywords,watch/providers,external_ids,reviews,images,keywords';
  final String _additionalData =
      'append_to_response=$_appendToResponse&include_image_language=$_includeImageLanguage&include_video_language=$_includeVideoLanguage';

  String _buildUrl(String path, [Map<String, dynamic>? queryParams]) {
    final uri = Uri.parse('$_baseUrl/$path').replace(
      queryParameters: {
        // 'api_key': _apiKey,P
        ...?queryParams,
        'without_genres': '10763,10764,10767,10766,10749',
        'language': language,
      },
    );

    log('🔍 URL: ${uri.toString()}');
    return uri.toString();
  }

  static String get baseUrl => _baseUrl;
  ApiResposne _get(
    String url, {
    CancelToken? cancelToken,
    CachePolicy? overridePolicy,
  }) async {
    final policy =
        overridePolicy ??
        (AppDio.hasConnectivity ? CachePolicy.request : CachePolicy.forceCache);

    final requestOptions = await AppDio.cacheOptions.then(
      (value) => value.copyWith(policy: policy).toOptions(),
    );

    final response = await dio.get(
      url,
      cancelToken: cancelToken,
      options: requestOptions,
    );

    return response.data;
  }

  // 🎬 Popular (with genre)
  ApiResposne getPopular({
    required dynamic genreId,
    String type = 'movie',
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    final url = _buildUrl('discover/$type', {
      'with_genres': genreId,
      'page': page.toString(),
    });

    return (await _get(
      url,
      cancelToken: cancelToken,
      overridePolicy: page <= 3 ? CachePolicy.request : CachePolicy.noCache,
    ));
  }

  // 🔍 Search movie
  ApiResposne searchRequest({
    required String query,
    String type = 'movie',
    CancelToken? cancelToken,
  }) async {
    final url = _buildUrl('search/$type', {'query': query});

    return (await _get(
      url,
      cancelToken: cancelToken,
      overridePolicy: CachePolicy.noCache,
    ));
  }

  // 👤 Search actor
  ApiResposne searchActor({
    required String query,
    CancelToken? cancelToken,
  }) async {
    final url = _buildUrl('search/person', {'query': query});

    return (await _get(url, cancelToken: cancelToken));
  }

  ApiResposne getDetails({
    required int id,
    String type = 'movie',
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    final url =
        '${_buildUrl('$type/$id', {'page': page.toString()})}&$_additionalData';

    return (await _get(url, cancelToken: cancelToken));
  }

  ApiResposne getGeneralTv({
    required String type,
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    final url = _buildUrl('discover/$type', {'page': page.toString()});

    return (await _get(url, cancelToken: cancelToken));
  }

  // 📺 Season details
  ApiResposne getSeasonDetails({
    required int tvid,
    required num season,
    CancelToken? cancelToken,
  }) async {
    final url = '${_buildUrl('tv/$tvid/season/$season')}&$_additionalData';
    return (await _get(url, cancelToken: cancelToken));
  }

  // 🎯 Recommendations
  ApiResposne getRecommendations({
    required int id,
    String type = 'movie',
    int? page,
    CancelToken? cancelToken,
  }) async {
    final url = _buildUrl('$type/$id/recommendations', {
      'without_genres': '10749',
      'page': page.toString(),
    });
    return (await _get(url, cancelToken: cancelToken));
  }

  // 📈 Trending
  ApiResposne getTrending({
    String type = 'movie',
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    final url = _buildUrl('trending/$type/week', {'page': page.toString()});
    return (await _get(url, cancelToken: cancelToken));
  }

  // ⭐ Top Rated
  ApiResposne getTopRated({
    required String type,
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    final url = _buildUrl('$type/top_rated', {'page': page.toString()});

    return (await _get(
      url,
      cancelToken: cancelToken,
      overridePolicy: page <= 5 ? CachePolicy.request : CachePolicy.noCache,
    ));
  }

  ApiResposne getAiringToday({
    required String type,
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    final url = _buildUrl('$type/airing_today', {'page': page.toString()});
    return (await _get(
      url,
      cancelToken: cancelToken,
      overridePolicy: page <= 5 ? CachePolicy.request : CachePolicy.noCache,
    ));
  }

  ApiResposne getUpcoming({
    required String type,
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    final url = _buildUrl('$type/upcoming', {'page': page.toString()});
    return (await _get(
      url,
      cancelToken: cancelToken,
      overridePolicy: page <= 5 ? CachePolicy.request : CachePolicy.noCache,
    ));
  }

  ApiResposne getNowPlaying({
    String type = 'movie',
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    final url = _buildUrl('movie/now_playing', {'page': page.toString()});
    log(url);
    return (await _get(
      url,
      cancelToken: cancelToken,
      overridePolicy: page <= 5 ? CachePolicy.request : CachePolicy.noCache,
    ));
  }

  ApiResposne getSimilar({
    required int id,
    String type = 'movie',
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    final url = _buildUrl('$type/$id/similar', {'page': page.toString()});
    return (await _get(url, cancelToken: cancelToken));
  }
}
