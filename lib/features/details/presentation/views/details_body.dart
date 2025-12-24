import 'package:cinemax_app_new/core/network/api/services/tmdb/tmdb_image_size.dart';
import 'package:cinemax_app_new/core/utils/cubit_parameters/params.dart';
import 'package:cinemax_app_new/features/details/domain/enums/tabs_enums.dart';
import 'package:cinemax_app_new/features/details/presentation/cubits/fetch_details_cubit/fetch_details_cubit.dart';
import 'package:cinemax_app_new/features/details/presentation/cubits/fetch_details_cubit/fetch_details_state.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/shared/build_body_content.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/shared/custom_tab_bar.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/shared/details_sliver_app_bar.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/shared/stacked_details_background.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/shared/time_bloc_selector.dart';
import 'package:cinemax_app_new/features/favorite/domain/entities/favorite_entity.dart';
import 'package:cinemax_app_new/hooks/ui/use_scroll_collapse_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../../core/utils/enums/content_type.dart';

class DetailsBody extends HookWidget {
  const DetailsBody({
    super.key,
    required this.id,
    required this.contentType,
    this.fromRoute = 'home',
    this.heroTag,
    required this.posterImage,
  });

  final int id;
  final ContentType contentType;
  final String fromRoute;
  final String? heroTag;
  final String posterImage;

  @override
  Widget build(BuildContext context) {
    final movieTabs = MovieDetailsEnum.values
        .map((e) => e.localizedTab(context))
        .toList();
    final seriesTabs = SeriesDetailsEnum.values
        .map((e) => e.localizedTab(context))
        .toList();
    final tabs = contentType == ContentType.movies ? movieTabs : seriesTabs;
    final scrollCollapse = useScrollCollapseDebounced(300);
    final sizedPosterImage = tmdbImageSize(TmdbImageSize.w500, posterImage);

    // Create placeholder FavoriteEntity from route parameters
    final placeholderFavorite = FavoriteEntity(
      id: id,
      title: '',
      posterImage: posterImage,
      gener: [],
      contentType: contentType,
      date: '',
      seasonNumber: 0,
      specificId: id,
      posterImageBackup: posterImage,
      backGroundImage: posterImage,
      episodeNumber: 0,
      rating: 0,
    );

    return DefaultTabController(
      length: tabs.length,
      child: NestedScrollView(
        controller: scrollCollapse.scrollController,
        headerSliverBuilder: (_, _) => [
          BlocBuilder<FetchDetailsCubit, FetchDetailsState>(
            builder: (context, state) {
              // Extract header data from state or use placeholders
              final headerData = _getHeaderData(
                state,
                placeholderFavorite,
                sizedPosterImage,
              );

              return DetailsSliverAppBar(
                favorite: headerData.favorite,
                title: headerData.title,
                fromRoute: fromRoute,
                isCollapsedNotifier: scrollCollapse.isCollapsedNotifier,
                backgroundWidget: StackedDetailsBackGorund(
                  backGroundImage: headerData.backGroundImage,
                  posterImage: sizedPosterImage,
                  title: headerData.title,
                  date: headerData.date,
                  rating: headerData.rating,
                  heroTag: heroTag,
                  timeBlocSelector: TimeBlocSelector(),
                ),
              );
            },
          ),
          CustomTabBar(tabs: tabs),
        ],
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: BuildBodyContent(id: id, contentType: contentType),
        ),
      ),
    );
  }

  _HeaderData _getHeaderData(
    FetchDetailsState state,
    FavoriteEntity placeholderFavorite,
    String sizedPosterImage,
  ) {
    return state.maybeWhen(
      successMovie: (movie) => _HeaderData(
        favorite: movie.toFavoriteEntity(),
        title: movie.movieTitle,
        backGroundImage: tmdbImageSize(
          TmdbImageSize.original,
          movie.backgroundImage ?? posterImage,
        ),
        date: movie.date ?? '',
        rating: movie.rating ?? 0,
      ),
      successSeries: (series) => _HeaderData(
        favorite: series.toFavoriteEntity(),
        title: series.seriesTitle ?? '',
        backGroundImage: tmdbImageSize(
          TmdbImageSize.original,
          series.backgroundImage ?? posterImage,
        ),
        date: series.firstDate ?? '',
        rating: series.rating ?? 0,
      ),
      orElse: () => _HeaderData(
        favorite: placeholderFavorite,
        title: '',
        backGroundImage: posterImage,
        date: '',
        rating: 0,
      ),
    );
  }
}

class _HeaderData {
  final FavoriteEntity favorite;
  final String title;
  final String backGroundImage;
  final String date;
  final num rating;

  _HeaderData({
    required this.favorite,
    required this.title,
    required this.backGroundImage,
    required this.date,
    required this.rating,
  });
}
