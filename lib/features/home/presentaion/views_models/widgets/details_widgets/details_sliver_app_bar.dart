import 'package:cinemax_app_new/core/utils/go_router.dart';
import 'package:cinemax_app_new/features/favorite/domain/entities/favorite_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../core/utils/enums/content_type.dart';
import '../../../../../favorite/presentation/widgets/favorite_button.dart';
import '../opcaity_details_image.dart';

class DetailsSliverAppBar extends StatelessWidget {
  const DetailsSliverAppBar({
    super.key,
    required this.imageUrl,
    required this.isCollapsed,
    required this.title,
    required this.id,
    this.fromRoute = 'home',
    required this.contentType,
  });
  final String imageUrl;
  final bool isCollapsed;
  final String title;
  final num id;
  final String fromRoute;
  final ContentType contentType;

  @override
  Widget build(BuildContext context) {
    final uniqueId = '$id-$contentType';
    return SliverAppBar(
      key: ValueKey('DetailsSliverAppBar-$uniqueId'),
      title: isCollapsed
          ? Text(title, style: AppStyles.textStyle18(context))
          : null,
      centerTitle: true,
      pinned: true,
      backgroundColor: AppPrimaryColors.dark,
      leadingWidth: 50,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          } else {
            switch (fromRoute) {
              case 'search':
                GoRouter.of(context).go(AppRouter.kSearchView);
                break;
              case 'home':
              default:
                GoRouter.of(context).go(AppRouter.kNavigationView);
            }
          }
        },
      ),
      actions: [
        FavoriteButton(
          key: ValueKey('FavoriteButton-$uniqueId'),
          favorite: FavoriteEntity(
            id: id.toInt(),
            contentType: contentType,
            date: DateTime.now().toString(),
            imageUrl: imageUrl,
            title: title,
            gener: [],
          ),
        ),
      ],
      expandedHeight: MediaQuery.sizeOf(context).height * 0.4,
      flexibleSpace: FlexibleSpaceBar(
        background: OpcaityDetailsImage(imageUrl: imageUrl),
      ),
    );
  }
}
