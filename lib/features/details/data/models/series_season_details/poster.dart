class Poster {
  num? aspectRatio;
  num? height;
  String? iso6391;
  String? filePath;
  double? voteAverage;
  num? voteCount;
  num? width;

  Poster({
    this.aspectRatio,
    this.height,
    this.iso6391,
    this.filePath,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  factory Poster.fromJson(Map<String, dynamic> json) => Poster(
    aspectRatio: (json['aspect_ratio'] as num?)?.toDouble(),
    height: json['height'] as num?,
    iso6391: json['iso_639_1'] as String?,
    filePath: json['file_path'] as String?,
    voteAverage: (json['vote_average'] as num?)?.toDouble(),
    voteCount: json['vote_count'] as num?,
    width: json['width'] as num?,
  );

  Map<String, dynamic> toJson() => {
    'aspect_ratio': aspectRatio,
    'height': height,
    'iso_639_1': iso6391,
    'file_path': filePath,
    'vote_average': voteAverage,
    'vote_count': voteCount,
    'width': width,
  };
}
