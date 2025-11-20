import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:cinemax_app_new/features/favorite/domain/entities/favorite_entity.dart';
import 'package:cinemax_app_new/features/favorite/presentation/widgets/favorite_button.dart';
import 'package:cinemax_app_new/features/home/presentation/views_models/widgets/opcaity_details_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'home_icon_button.dart';
import 'share_button.dart';

class DetailsSliverAppBar extends StatelessWidget {
  const DetailsSliverAppBar({
    super.key,
    this.backGroundImage,
    required this.title,
    required this.id,
    this.fromRoute = 'home',
    required this.contentType,
    this.seasonNumber,
    this.episodeNumber,
    this.seriesBackUpImage,
    required this.date,
    this.specificId,
    this.defaultDetailsBackGroundImage,
    this.posterImage,
    required this.isCollapsedNotifier,
  });
  final String? backGroundImage;
  final String title;
  final int id;
  final String fromRoute;
  final ContentType contentType;
  final int? seasonNumber;
  final int? episodeNumber;
  final String? seriesBackUpImage;
  final String date;
  final int? specificId;
  final String? defaultDetailsBackGroundImage;
  final String? posterImage;
  final ValueNotifier<bool> isCollapsedNotifier;
  @override
  Widget build(BuildContext context) {
    final uniqueId = '$id-$contentType';
    return ValueListenableBuilder<bool>(
      valueListenable: isCollapsedNotifier,
      builder: (context, isCollapsed, child) {
        return SliverAppBar(
          key: ValueKey('DetailsSliverAppBar-$uniqueId'),
          title: isCollapsed
              ? Text(title, style: AppStyles.textStyle24(context))
              : null,

          pinned: true,
          backgroundColor: Theme.of(context).colorScheme.surface,
          foregroundColor: isCollapsed
              ? Theme.of(context).colorScheme.onSurface
              : Theme.of(context).colorScheme.onInverseSurface,
          leadingWidth: 50,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              } else {
                switch (fromRoute) {
                  case 'search':
                    context.goNamed(RouteName.search);
                    break;
                  case 'home':
                  default:
                    context.goNamed(RouteName.home);
                }
              }
            },
          ),
          actions: _buildActions(),
          expandedHeight: MediaQuery.sizeOf(context).height * 0.4,
          flexibleSpace: FlexibleSpaceBar(
            background: OpcaityDetailsImage(
              detailsBackGroundImage: backGroundImage,
              defaultDetailsBackGroundImage: defaultDetailsBackGroundImage,
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildActions() {
    final uniqueId = '$id-$contentType';
    return [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: FavoriteButton(
          key: ValueKey('FavoriteButton-$uniqueId'),
          favorite: FavoriteEntity(
            id: id,
            contentType: contentType,
            date: date,
            title: title,
            imageUrl: posterImage ?? defaultDetailsBackGroundImage!,
            gener: [],
            backGroundImage: backGroundImage ?? defaultDetailsBackGroundImage!,
            seasonNumber: seasonNumber ?? 0,
            episodeNumber: episodeNumber ?? 0,
            specificId: specificId ?? 0,
            seasonPosterUrl: seriesBackUpImage ?? '',
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ShareButton(
          contentType: contentType,
          id: id,
          seasonNumber: seasonNumber,
          episodeNumber: episodeNumber,
        ),
      ),
      Padding(padding: const EdgeInsets.all(8.0), child: HomeIconButton()),
    ];
  }
}
