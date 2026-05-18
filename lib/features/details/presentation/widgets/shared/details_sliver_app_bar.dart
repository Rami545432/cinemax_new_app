import 'package:flutter/material.dart';
import 'package:movify/core/utils/app_styles.dart';
import 'package:movify/core/utils/enums/content_type.dart';
import 'package:movify/features/details/presentation/widgets/shared/back_button.dart';
import 'package:movify/features/details/presentation/widgets/shared/home_icon_button.dart';
import 'package:movify/features/details/presentation/widgets/shared/share_button.dart';
import 'package:movify/features/favorite/domain/entities/favorite_entity.dart';
import 'package:movify/features/favorite/presentation/widgets/favorite_button.dart';
import 'package:movify/shared/presentation/widgets/in_app_view.dart';

class DetailsSliverAppBar extends StatelessWidget {
  const DetailsSliverAppBar({
    super.key,
    required this.favorite,
    required this.isCollapsedNotifier,
    this.backgroundWidget,
    required this.title,
    required this.expandedHeight,
  });

  final FavoriteEntity favorite;
  final String title;
  final ValueNotifier<bool> isCollapsedNotifier;
  final Widget? backgroundWidget;
  final double expandedHeight;
  @override
  Widget build(BuildContext context) {
    final uniqueId = '${favorite.specificId}-${favorite.contentType}';
    final actions = _buildActions(context);
    return ValueListenableBuilder(
      valueListenable: isCollapsedNotifier,
      builder: (context, value, child) => SliverAppBar(
        key: ValueKey('DetailsSliverAppBar-$uniqueId'),
        title: isCollapsedNotifier.value
            ? Text(favorite.title, style: AppStyles.textStyle24(context))
            : null,
        pinned: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        leadingWidth: 50,
        leading: const LeadingBackButton(),
        actions: actions,
        expandedHeight: expandedHeight,
        flexibleSpace: FlexibleSpaceBar(
          stretchModes: const [
            StretchMode.zoomBackground,
            StretchMode.blurBackground,
          ],
          background: backgroundWidget,
        ),
      ),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    final uniqueId = '${favorite.title}-${favorite.contentType}';
    return [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: FavoriteButton(
          favoriteEntity: favorite,
          key: ValueKey('NewFavoriteButton-$uniqueId'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ShareButton(
          contentType: favorite.contentType,
          id: favorite.specificId,
          seasonNumber: favorite.seasonNumber,
          episodeNumber: favorite.episodeNumber,
        ),
      ),
      const Padding(padding: EdgeInsets.all(8.0), child: HomeIconButton()),
      IconButton(
        onPressed: () {
          Navigator.push<void>(
            context,
            MaterialPageRoute(
              builder: (context) => CustomInappView(
                movieOrTvUrl: favorite.contentType == ContentType.movies
                    ? 'https://vsembed.ru/embed/movie?tmdb=${favorite.specificId}'
                    : 'https://vsembed.ru/embed/tv?tmdb=${favorite.tmbdId}&season=${favorite.seasonNumber}&episode=${favorite.episodeNumber}',
                title: favorite.title,
              ),
            ),
          );
        },
        icon: const Icon(Icons.play_arrow_rounded, color: Colors.white),
      ),
    ];
  }
}
