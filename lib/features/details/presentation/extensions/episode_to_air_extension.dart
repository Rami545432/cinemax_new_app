import 'package:movify/features/details/domain/value_objects/last_episode_to_air.dart';
import 'package:movify/features/details/domain/value_objects/next_episode_to_air.dart';
import 'package:movify/features/details/presentation/models/episode_to_air_model.dart';

extension NextEpisodeToAirExtension on NextEpisodeToAir {
  EpisodeToAirModel toEpisodeToAirModel() => EpisodeToAirModel(
    id: id,
    seasonNumber: seasonNumber,
    episodeNumber: episodeNumber,
    airDate: airDate,
    voteAverage: voteAverage,
    name: name,
    overview: overview,
    stillPath: stillPath,
    showId: showId,
    voteCount: voteCount,
    episodeType: episodeType,
    productionCode: productionCode,
    runtime: runtime,
  );
}

extension LastEpisodeToAirExtension on LastEpisodeToAir {
  EpisodeToAirModel toEpisodeToAirModel() => EpisodeToAirModel(
    id: id,
    seasonNumber: seasonNumber,
    episodeNumber: episodeNumber,
    airDate: airDate,
    voteAverage: voteAverage,
    name: name,
    overview: overview,
    stillPath: stillPath,
    showId: showId,
    voteCount: voteCount,
    episodeType: episodeType,
    productionCode: productionCode,
    runtime: runtime,
  );
}
