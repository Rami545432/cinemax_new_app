class Logo {
  double? aspectRatio;
  int? height;
  String? iso31661;
  String? iso6391;
  String? filePath;
  double? voteAverage;
  int? voteCount;
  int? width;

  Logo({
    this.aspectRatio,
    this.height,
    this.iso31661,
    this.iso6391,
    this.filePath,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  factory Logo.fromJson(Map<String, dynamic> json) => Logo(
    aspectRatio: (json['aspect_ratio'] as num?)?.toDouble(),
    height: json['height'] as int?,
    iso31661: json['iso_3166_1'] as String?,
    iso6391: json['iso_639_1'] as String?,
    filePath: json['file_path'] as String?,
    voteAverage: (json['vote_average'] as num?)?.toDouble(),
    voteCount: json['vote_count'] as int?,
    width: json['width'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'aspect_ratio': aspectRatio,
    'height': height,
    'iso_3166_1': iso31661,
    'iso_639_1': iso6391,
    'file_path': filePath,
    'vote_average': voteAverage,
    'vote_count': voteCount,
    'width': width,
  };
}
