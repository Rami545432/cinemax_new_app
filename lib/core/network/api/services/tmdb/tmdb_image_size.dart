enum TmdbImageSize {
  w92,
  w154,
  w185,
  w300,
  w500,
  w780,
  original;

  String get path => 'https://image.tmdb.org/t/p/$name';
}

String tmdbImageSize(TmdbImageSize size, String path) => '${size.path}$path';
