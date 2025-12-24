import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/shared/back_button.dart';
import 'package:cinemax_app_new/features/favorite/domain/entities/favorite_entity.dart';
import 'package:cinemax_app_new/features/favorite/presentation/widgets/favorite_button.dart';
import 'package:flutter/material.dart';
import 'home_icon_button.dart';
import 'share_button.dart';

class DetailsSliverAppBar extends StatelessWidget {
  const DetailsSliverAppBar({
    super.key,
    required this.favorite,
    required this.isCollapsedNotifier,
    this.fromRoute = 'home',
    this.backgroundWidget,
    required this.title,
  });

  final FavoriteEntity favorite;
  final String title;
  final ValueNotifier<bool> isCollapsedNotifier;
  final String fromRoute;
  final Widget? backgroundWidget;
  @override
  Widget build(BuildContext context) {
    final uniqueId = '${favorite.id}-${favorite.contentType}';
    final actions = _buildActions();
    return ValueListenableBuilder<bool>(
      valueListenable: isCollapsedNotifier,
      builder: (context, isCollapsed, child) {
        return SliverAppBar(
          key: ValueKey('DetailsSliverAppBar-$uniqueId'),
          title: Opacity(
            opacity: isCollapsed ? 1.0 : 0.0,
            child: Text(favorite.title, style: AppStyles.textStyle24(context)),
          ),
          pinned: true,
          backgroundColor: Theme.of(context).colorScheme.surface,
          foregroundColor: isCollapsed
              ? Theme.of(context).colorScheme.onSurface
              : Theme.of(context).colorScheme.onInverseSurface,
          leadingWidth: 50,
          leading: LeadingBackButton(fromRoute: fromRoute),
          actions: actions,
          expandedHeight: MediaQuery.sizeOf(context).height * 0.7,
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: const [
              StretchMode.zoomBackground,
              StretchMode.blurBackground,
            ],
            background: backgroundWidget,
          ),
        );
      },
    );
  }

  List<Widget> _buildActions() {
    final uniqueId = '${favorite.id}-${favorite.contentType}';
    return [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: FavoriteButton(
          key: ValueKey('FavoriteButton-$uniqueId'),
          favorite: favorite,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ShareButton(
          contentType: favorite.contentType,
          id: favorite.id,
          seasonNumber: favorite.seasonNumber,
          episodeNumber: favorite.episodeNumber,
        ),
      ),
      Padding(padding: const EdgeInsets.all(8.0), child: HomeIconButton()),
    ];
  }
}
