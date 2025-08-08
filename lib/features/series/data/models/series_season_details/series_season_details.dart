import '../../../../../models/movie_details_model/credits.dart';
import '../../../../../models/movie_details_model/videos.dart';
import '../../../domain/entites/series_season_details_entitiy.dart';
import 'episode.dart';
import 'images.dart';

class SeriesSeasonDetails extends SeriesSeasonDetailsEntitiy {
  String? airDate;
  List<Episode>? episodes;
  String? name;
  String? overview;
  num? id;
  String? posterPath;
  num? seasonNumber;
  num? voteAverage;
  Credits? credits;
  Videos? videos;
  Images? images;

  SeriesSeasonDetails({
    this.id,
    this.airDate,
    this.episodes,
    this.name,
    this.overview,
    this.posterPath,
    this.seasonNumber,
    this.voteAverage,
    this.credits,
    this.videos,
    this.images,
  }) : super(
         seasonName: name ?? '',
         seasonOverView: overview ?? '',
         seasonDate: airDate ?? '',
         seasonNum: seasonNumber ?? 0,
         seasonRating: voteAverage ?? 0,
         seasonVideos: videos,
         seasonPosterPath: posterPath ?? "",
         seasonId: id ?? 0,
         seasonCredits: credits,
         seasonEpisodes: episodes ?? [],
       );

  factory SeriesSeasonDetails.fromJson(Map<String, dynamic> json) {
    return SeriesSeasonDetails(
      airDate: json['air_date'] as String?,
      episodes: (json['episodes'] as List<dynamic>?)
          ?.map((e) => Episode.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      overview: json['overview'] as String?,
      id: json['id'] as int?,
      posterPath: json['poster_path'] as String?,
      seasonNumber: json['season_number'] as num?,
      voteAverage: json['vote_average'] as num?,
      credits: json['credits'] == null
          ? null
          : Credits.fromJson(json['credits'] as Map<String, dynamic>),
      videos: json['videos'] == null
          ? null
          : Videos.fromJson(json['videos'] as Map<String, dynamic>),
      images: json['images'] == null
          ? null
          : Images.fromJson(json['images'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'air_date': airDate,
    'episodes': episodes?.map((e) => e.toJson()).toList(),
    'name': name,
    'overview': overview,
    'id': id,
    'poster_path': posterPath,
    'season_number': seasonNumber,
    'vote_average': voteAverage,
    'credits': credits?.toJson(),
    'videos': videos?.toJson(),
    'images': images?.toJson(),
  };
}
