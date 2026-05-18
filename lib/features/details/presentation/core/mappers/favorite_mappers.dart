import 'package:movify/core/utils/enums/content_type.dart';
import 'package:movify/features/details/presentation/core/details_data_navigation.dart';
import 'package:movify/features/favorite/domain/entities/favorite_entity.dart';

class FavoriteMapper {
  static FavoriteEntity fromNavigationData(DetailsNavigationData data) =>
      switch (data) {
        final MovieNavData movie => FavoriteEntity(
          backdropImage: movie.backdropImage ?? movie.posterImage,
          contentType: ContentType.movies,
          date: movie.date ?? '',
          genres: movie.genres ?? [],
          specificId: movie.tmdbId,
          posterImage: movie.posterImage,
          rating: movie.rating ?? 0,
          title: movie.title,
          tmbdId: movie.tmdbId,
        ),
        final SeriesNavData series => FavoriteEntity(
          backdropImage: series.backdropImage ?? series.posterImage,
          contentType: ContentType.series,
          date: series.date ?? '',
          genres: series.genres ?? [],
          specificId: series.tmdbId,
          posterImage: series.posterImage,
          rating: series.rating ?? 0,
          title: series.title,
          tmbdId: series.tmdbId,
        ),
        final SeasonNavData season => FavoriteEntity(
          backdropImage: season.backdropImage ?? season.posterImage,
          contentType: ContentType.seasons,
          date: season.date ?? '',
          genres: const [],
          specificId: season.specificId,
          posterImage: season.posterImage,
          rating: season.rating ?? 0,
          title: season.seasonName ?? 'Season ${season.seasonNumber}',
          seasonNumber: season.seasonNumber,
          tmbdId: season.tmdbId,
        ),
        final EpisodeNavData episode => FavoriteEntity(
          backdropImage: episode.backdropImage ?? episode.posterImage,
          contentType: ContentType.episodes,
          date: episode.date ?? '',
          genres: const [],
          specificId: episode.specificId,
          posterImage: episode.posterImage,
          rating: episode.rating ?? 0,
          title: 'Episode ${episode.episodeNumber}',
          seasonNumber: episode.seasonNumber,
          episodeNumber: episode.episodeNumber,
          tmbdId: episode.tmdbId,
        ),
      };
}
