enum TmdbImageSize { w92, w154, w185, w300, w500, w780, original }

String tmdbImageSize(TmdbImageSize size, String path) {
  return 'https://image.tmdb.org/t/p/${size.name}$path';
}
